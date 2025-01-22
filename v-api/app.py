from flask import Flask, jsonify, request
from flask_cors import CORS
import sqlite3
import json

app = Flask(__name__)
CORS(app)  


def setup_database():
    conn = sqlite3.connect('products.db')
    c = conn.cursor()
    
 
    c.execute('''
        CREATE TABLE IF NOT EXISTS products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_name TEXT NOT NULL,
            nafdac_number TEXT UNIQUE NOT NULL,
            manufacturer_name TEXT NOT NULL
        )
    ''')
    
 
    dummy_products = [
        ('Paracetamol 500mg', 'A5-6789', 'ABC Pharmaceuticals'),
        ('Ibuprofen 400mg', 'B2-1234', 'XYZ Pharma'),
        ('Amoxicillin 250mg', 'C7-5678', 'Medical Labs Ltd'),
        ('Vitamin C 1000mg', 'D9-9012', 'Wellness Corp'),
    ]
    
    try:
        c.executemany('INSERT INTO products (product_name, nafdac_number, manufacturer_name) VALUES (?, ?, ?)',
                     dummy_products)
        conn.commit()
    except sqlite3.IntegrityError:
        pass  
    
    conn.close()


setup_database()

@app.route('/api/verify-product/<nafdac_number>', methods=['GET'])
def verify_product(nafdac_number):
    conn = sqlite3.connect('products.db')
    c = conn.cursor()
    
    c.execute('SELECT * FROM products WHERE nafdac_number = ?', (nafdac_number,))
    product = c.fetchone()
    conn.close()
    
    if product:
        return jsonify({
            "status": "success",
            "message": "Product found and verified.",
            "product": {
                "productName": product[1],
                "nafdacNumber": product[2],
                "manufacturer": {
                    "name": product[3]
                }
            }
        })
    else:
        return jsonify({
            "status": "error",
            "message": "Product not found in NAFDAC records."
        }), 404

@app.route('/', methods=['GET'])
def home():
    return jsonify({
        "status": "success",
        "message": "Welcome to the Product Verification API",
        "endpoints": {
            "verify_product": "/api/verify-product/<nafdac_number>",
            "all_products": "/api/products"
        }
    })


@app.route('/api/products', methods=['GET'])
def get_all_products():
    conn = sqlite3.connect('products.db')
    c = conn.cursor()
    
    c.execute('SELECT * FROM products')
    products = c.fetchall()
    conn.close()
    
    return jsonify({
        "status": "success",
        "products": [
            {
                "productName": product[1],
                "nafdacNumber": product[2],
                "manufacturer": {
                    "name": product[3]
                }
            }
            for product in products
        ]
    })

if __name__ == '__main__':
    app.run(debug=True)