SELECT *
FROM data_entry de 
INNER JOIN merchant_header m ON m.data_entry_id = de.id 
INNER JOIN task t ON t.id = de.task_id 
INNER JOIN batch b ON b.id = m.batch_id 
INNER JOIN zip z ON z.id = b.zip_id
INNER JOIN transaction_type tt ON tt.id = b.trans_type_id;

SELECT CONCAT(z.region_code, '_', z.rec_date, '_', z.operator_id, '_', LPAD(z.sequence,3,'0'), '_', tt.type) AS `match`
FROM data_entry de 
INNER JOIN merchant_header m ON m.data_entry_id = de.id 
INNER JOIN task t ON t.id = de.task_id 
INNER JOIN batch b ON b.id = m.batch_id 
INNER JOIN zip z ON z.id = b.zip_id
INNER JOIN transaction_type tt ON tt.id = b.trans_type_id;