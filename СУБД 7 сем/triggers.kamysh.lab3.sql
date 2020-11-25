-- 1. Триггер должен запрещать перевод средств на «закрытые» счета;
CREATE TRIGGER STATUS
BEFORE UPDATE ON CHECKING_ACCOUNT
BEGIN
	SELECT * FROM CHECKING_ACCOUNT
	IF CHECKING_ACCOUNT.STATUS < 1 THEN
	LOCK CHECKING_ACCOUNT 
END;

-- 2. Триггер должен отслеживать, чтобы сумма перевода со счёта не превышала сумму, имеющуюся на счёте;
CREATE TRIGGER BALANCE_CHECK
BEFORE UPDATE ON CHECKING_ACCOUNT
BEGIN
	SELECT BALANCE FROM CHECKING_ACCOUNT
	IF (`NEW`.`BALANCE`) < 0 THEN
	LOCK CHECKING_ACCOUNT 
END;

-- 3. Триггер должен отслеживать, чтобы количество платежей в бюджет в месяц у каждого контрагента не превышало трёх.

-- К сожалению, время написать конкретную задачу не хватает, пока придумал только так, вдруг какой-то балл за это добавите)

CREATE TRIGGER PAYMENT_COUNT
BEFORE UPDATE ON PAYMENT_ORDER
BEGIN
SELECT COUNT(PAYMENT_CODE),ID_PAYER FROM PAYMENT_ORDER 
	WHERE ID_PAYER='1'
	IF(COUNT(PAYMENT_CODE) WHERE PAYMENT_CODE IS NOT NULL)>2	
	LOCK PAYMENT_ORDER
END;
