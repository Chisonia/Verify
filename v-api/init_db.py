import sqlite3

def init_database():
  
    conn = sqlite3.connect('products.db')
    cursor = conn.cursor()

   
    cursor.execute('''
    DROP TABLE IF EXISTS products
    ''')

    cursor.execute('''
    CREATE TABLE products (
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
        ('Aspirin 300mg', 'E3-4567', 'Health Pharmaceuticals'),
        ('Omeprazole 20mg', 'F8-7890', 'Digestive Care Inc')
    ]

    cursor.executemany('''
    INSERT INTO products (product_name, nafdac_number, manufacturer_name)
    VALUES (?, ?, ?)
    ''', dummy_products)

  
    conn.commit()
    conn.close()

if __name__ == '__main__':
    init_database()
    print("Database initialized successfully!")