set foreign_key_checks = 0;
truncate merchant_header;
truncate `transaction`;
truncate data_entry;
update batch set entry_status = null, verify_status = null, is_exception = null where id > 0;