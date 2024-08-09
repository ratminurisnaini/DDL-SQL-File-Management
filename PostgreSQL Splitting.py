# Import Library
import re
import os

# Paths
file_name = 'public.sql' # The file to be split (customizable)
folder_name = 'PostgreSQL Sample Database' # The folder where the file is located (customizable)
schema_name = file_name.replace('.sql','')

current_path = os.getcwd()
folder_path = current_path + '\\' + folder_name
file_path = folder_path + '\\' + file_name
folders = []

# Read SQL File
with open(file_path,'r') as f:
    text = f.read()

# Get Text Pattern for Type
type_name = re.findall('(?<=-- Type structure for )[\w]+', text) # Find type names
type_split_text = re.findall('CREATE TYPE[\s\S]+?;', text) # Find DDL script for the types
folders.append('Types') if len(type_name) != 0 else None

# Get Text Pattern for Sequence
sequence_name = re.findall('(?<=-- Sequence structure for )[\w]+', text) # Find sequence names
sequence_split_text = re.findall('CREATE SEQUENCE[\s\S]+?;', text) # Find DDL script for the sequences

for seq_name in sequence_name: # Add 'alter sequence' process script after 'create sequence'
    sequence_split_text[sequence_name.index(seq_name)] = sequence_split_text[sequence_name.index(seq_name)] + '\n'*2 + re.findall(f'SELECT setval\(\'"{schema_name}"."{seq_name}"[\s\S]+?;', text)[0]

folders.append('Sequences') if len(sequence_name) != 0 else None

# Get Text Pattern for Table
table_name = re.findall('(?<=-- Table structure for )[\w]+', text) # Find table names
table_split_text = re.findall('CREATE TABLE[\s\S]+?;', text) # Find DDL script for the tables

table_name_by_pk = re.findall(f'(?<=-- Primary Key structure for table )[\w]+', text) # Find table names that have primary keys
pk_split_text = re.findall('ALTER TABLE[\S ]+?PRIMARY KEY[\s\S]+?;', text) # Find DDL script for the primary keys

for table_pk in table_name_by_pk: # Add primary keys to the tables that have primary keys
    table_split_text[table_name.index(table_pk)] = table_split_text[table_name.index(table_pk)] + '\n'*2 + pk_split_text[table_name_by_pk.index(table_pk)]

table_name_by_fk = re.findall(f'(?<=-- Foreign Keys structure for table )[\w]+', text) # Find table names that have foreign keys

for table_fk in table_name_by_fk: # Add foreign keys to the tables that have foreign keys
    fk_split_text = re.findall(f'ALTER TABLE "{schema_name}"."{table_fk}"[\S ]+?FOREIGN KEY[\s\S]+?;', text)

    for fk_text in fk_split_text:
        table_split_text[table_name.index(table_fk)] = table_split_text[table_name.index(table_fk)] + '\n'*2 + fk_text

folders.append('Tables') if len(table_name) != 0 else None

# Get Text Pattern for Index
index_name = re.findall('(?<=CREATE INDEX ")[\w ]+(?=")|(?<=CREATE UNIQUE INDEX ")[\w ]+(?=")', text) # Find non-unique and unique indexes
index_split_text = re.findall('CREATE INDEX[\s\S]+?;|CREATE UNIQUE INDEX[\s\S]+?;', text) # Find DDL scripts for the non-unique and unique indexes

clustered_index_split_text = list(set(re.findall('ALTER TABLE[\S ]+?CLUSTER ON[\S ]+?;', text))) # Find DDL scripts for clustered indexes, and get the unique values
clustered_index_name = re.findall('(?<=CLUSTER ON ")[\w ]+?(?=")', str(clustered_index_split_text)) # Find index names that have clustered indexes

for clust_idx in clustered_index_name: # Add clustered index setting to the clustered indexes
    index_split_text[index_name.index(clust_idx)] = index_split_text[index_name.index(clust_idx)] + '\n'*2 + clustered_index_split_text[clustered_index_name.index(clust_idx)]

folders.append('Indexes') if len(index_name) != 0 else None

# Get Text Pattern for Function
function_name = re.findall('(?<=-- Function structure for )[\w]+', text) # Find function names
function_split_text = re.findall('CREATE OR REPLACE FUNCTION[\s\S]+?(?=LANGUAGE)', text) # Find DDL scripts for functions

# Special Case for More Than One Function with The Same Name but Have Different Input Params and Contents
def create_new_name(object_name:list):
    duplicate_function = list({obj_name for obj_name in object_name if object_name.count(obj_name) > 1})

    for dup in duplicate_function: # Change the function names, for example there are two functions named 'my_function', then the name will be changed to my_function_1 & my_function_2
        count = 0
        for idx in range(len(object_name)):
            if object_name[idx] == dup:
                count += 1
                object_name[idx] = object_name[idx] + f'_{str(count)}'

create_new_name(function_name)

folders.append('Functions') if len(function_name) != 0 else None

# Get Text Pattern for Procedure
procedure_name = re.findall('(?<=-- Procedure structure for )[\w]+', text) # Find procedure names 
procedure_split_text = re.findall('CREATE OR REPLACE PROCEDURE[\s\S]+?(?=LANGUAGE)', text) # Find DDL scripts for the procedures
folders.append('Stored Procedures') if len(procedure_name) != 0 else None

# Get Text Pattern for View
view_name = re.findall('(?<=-- View structure for )[\w]+', text) # Get view names
view_split_text = re.findall('CREATE VIEW[\s\S]+?;', text) # Get DDL script for the views
folders.append('Views') if len(view_name) != 0 else None

# Get Text Pattern for Trigger
trigger_name = re.findall('(?<=CREATE TRIGGER ")[\w]+(?=")', text) # Get trigger names
trigger_split_text = re.findall('CREATE TRIGGER[\s\S]+?;', text) # Get DDL script for the triggers
folders.append('Triggers') if len(trigger_name) != 0 else None

# Special Case for More Than One Trigger with The Same Name but Have Different Tables
create_new_name(trigger_name)

# Create New Folders If Not Exist and Check The Existing Files in The Folders
for folder in folders:
    if not os.path.exists(folder_path + '\\' + folder):
        os.makedirs(folder_path + '\\' + folder)
    
    try:
        if folder == 'Types':
            type_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Sequences':
            sequence_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Tables':
            table_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Indexes':
            index_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Functions':
            function_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Stored Procedures':
            procedure_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Views':
            view_file = os.listdir(folder_path + '\\' + folder)
        elif folder == 'Triggers':
            trigger_file = os.listdir(folder_path + '\\' + folder)
    except:
        pass

# Create New File Names If Files with The Same Names Already Exist
def create_new_file_name(folder:str, object_name:list, object_file:list):
    for i in range(len(object_name)):
        check = re.findall("(?<=')"+object_name[i]+"[_1-9]*(?=.sql)", str(object_file)) # List the existing files that have similar prefix names. For example, customer, customer_1, customer_2
        
        if len(check) == 0: # If there is no file with similar name, then pass
            pass
        else: # But, if there is a file with a similar name, then we will name it using sequence
            if re.search(object_name[i]+'_[1-9]$', check[-1]):
                no = check[-1][-1]
                no = int(no) + 1
                no = str(no)
                object_name[i] = object_name[i] + '_' + no
            elif re.search(object_name[i], check[-1]):
                old_name = folder_path + '\\' + folder + '\\' + object_name[i] + '.sql'
                new_name = folder_path + '\\' + folder + '\\' + object_name[i] + '_1.sql'
                os.rename(old_name, new_name)
                object_name[i] = object_name[i] + '_2'

for folder in folders:
    if folder == 'Types':
        create_new_file_name(folder, type_name, type_file)
    elif folder == 'Sequences':
        create_new_file_name(folder, sequence_name, sequence_file)
    elif folder == 'Tables':
        create_new_file_name(folder, table_name, table_file)
    elif folder == 'Indexes':
        create_new_file_name(folder, index_name, index_file)
    elif folder == 'Functions':
        create_new_file_name(folder, function_name, function_file)
    elif folder == 'Stored Procedures':
        create_new_file_name(folder, procedure_name, procedure_file)
    elif folder == 'Views':
        create_new_file_name(folder, view_name, view_file)
    elif folder == 'Triggers':
        create_new_file_name(folder, trigger_name, trigger_file)

# Write The Separated Files
def write_file(folder:str, object_name:list, object_split_text:list):
    for i in range(len(object_name)):
        with open(folder_path + '\\' + folder + '\\' + object_name[i] + '.sql', 'w') as f:
            f.write(str(object_split_text[i]))

for folder in folders:
    if folder == 'Types':
        write_file(folder, type_name, type_split_text)
    elif folder == 'Sequences':
        write_file(folder, sequence_name, sequence_split_text)
    elif folder == 'Tables':
        write_file(folder, table_name, table_split_text)
    elif folder == 'Indexes':
        write_file(folder, index_name, index_split_text)
    elif folder == 'Functions':
        write_file(folder, function_name, function_split_text)
    elif folder == 'Stored Procedures':
        write_file(folder, procedure_name, procedure_split_text)
    elif folder == 'Views':
        write_file(folder, view_name, view_split_text)
    elif folder == 'Triggers':
        write_file(folder, trigger_name, trigger_split_text)

print('The file splitting was successful!')