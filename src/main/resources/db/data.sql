insert into user_tb(username, password, salt, name, email, contact, created_at) values('ssar', '1234', '1234', '동식', 'ssar@nate.com', '01011112222', now());
insert into user_tb(username, password, salt, name, email, contact, created_at) values('cos', '1234', '1234', '영식', 'cos@nate.com', '01022223333', now());

insert into enterprise_tb(enterprise_name, password, salt, address, contact, image, email, sector, size, created_at) values('ssar', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2', '영식', '1', '1', '1', '1', '1', now());

commit;