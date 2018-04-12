set foreign_key_checks=0;
truncate data_entry;
truncate merchant_header;
truncate `transaction`;
update batch set entry_status = null, verify_status = null, balance_status = null, is_exception = null where id < 20;
