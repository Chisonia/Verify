import sqlite3

def test_database():
    conn = sqlite3.connect('products.db')
    cursor = conn.cursor()
    
   
    cursor.execute('SELECT * FROM products')
    products = cursor.fetchall()
    
    print("\nProducts in database:")
    for product in products:
        print(f"ID: {product[0]}")
        print(f"Name: {product[1]}")
        print(f"NAFDAC Number: {product[2]}")
        print(f"Manufacturer: {product[3]}")
        print("-" * 30)
    
    conn.close()

if __name__ == '__main__':
    test_database()