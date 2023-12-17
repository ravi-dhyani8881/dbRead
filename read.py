import re

# Read SQL file
file_path = './db.sql'
with open(file_path, 'r') as file:
    sql_content = file.read()

# Extract CREATE TABLE statements
create_table_patterns = re.findall(r'CREATE TABLE `(.*?)` \((.*?)\);', sql_content, re.DOTALL)
for table_name, table_body in create_table_patterns:
    print(f'Table: {table_name}')
    print('Columns:')
    for column_definition in table_body.strip().split(','):
        print(f'  - {column_definition.strip()}')
    print()

# Extract ALTER TABLE statements
alter_table_patterns = re.findall(r'ALTER TABLE `(.*?)` ADD FOREIGN KEY \(`(.*?)`\) REFERENCES `(.*?)` \(`(.*?)`\);', sql_content)
for table_name, column_name, reference_table, reference_column in alter_table_patterns:
    print(f'Foreign Key: {table_name}.{column_name} -> {reference_table}.{reference_column}')
