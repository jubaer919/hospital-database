CREATE TABLE medical_histories (id INT PRIMARY KEY, admitted_at TIMESTAMP, status VARCHAR(200), patient_id INT);

CREATE TABLE patients (id INT PRIMARY KEY, name VARCHAR(100), date_of_birth DATE);

CREATE TABLE invoices (id int PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_histories_id INT);

CREATE TABLE invoice_items (id INT PRIMARY KEY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoices_id INT, treatments_id INT);

CREATE TABLE treatments (id INT PRIMARY KEY, type VARCHAR(100), name VARCHAR(100));

ALTER TABLE medical_histories ADD FOREIGN KEY (patient_id) REFERENCES patients(id);

ALTER TABLE invoices ADD FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);

ALTER TABLE invoices ADD CONSTRAINT UQ_Invoices_MedicalHistories UNIQUE (medical_histories_id);

ALTER TABLE invoice_items ADD FOREIGN KEY (invoices_id) REFERENCES invoices(id);

ALTER TABLE invoice_items ADD FOREIGN KEY (treatments_id) REFERENCES treatments(id);

CREATE TABLE treatments_histories (medical_histories_id INT, treatments_id INT);

ALTER TABLE treatments_histories ADD FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);

ALTER TABLE treatments_histories ADD FOREIGN KEY (treatments_id) REFERENCES treatments(id);

/* INDEXING */

CREATE INDEX patient_id_asc ON medical_histories (patient_id ASC);

CREATE INDEX medical_histories_id_asc ON invoices (medical_histories_id ASC);

CREATE INDEX invoices_id_asc ON  invoice_items (invoices_id ASC);

CREATE INDEX treatments_id_asc ON invoice_items (treatments_id ASC);

CREATE INDEX treatments_id_asc ON treatments_histories (treatments_id ASC);

CREATE INDEX medical_histories_id_asc ON treatments_histories (medical_histories_id ASC);

