--1. найти сведения обо всех выплатах, произведенных определенному контрагенту (УНН контрагента или ФИО физического лица – параметры запроса);
SELECT "DATE",
		SUM,
        AIM,
        ID_PAYER,
        ID_DEST
FROM "C##BSU".PAYMENT_ORDER
JOIN "C##BSU".CHECKING_ACCOUNT ON ( ID_DEST = "C##BSU".CHECKING_ACCOUNT.id)
JOIN "C##BSU".COUNTERPARTY ON ("C##BSU".CHECKING_ACCOUNT.ID = "C##BSU".COUNTERPARTY.CHECKING_ACCOUNT)
WHERE NAME = 'Mark Bulah';

--2. найти сведения о контрагентах, имеющих 2 и более незакрытых счетов;
SELECT NAME, COUNT(CHECKING_ACCOUNT) 
	FROM "C##BSU".COUNTERPARTY
	GROUP BY NAME 
	HAVING COUNT(CHECKING_ACCOUNT)>1;

--3. найти сведения о количестве платежей в первом квартале текущего года (относительно даты расчета).
SELECT COUNT(ORD_DATE)
FROM "C##BSU".PAYMENT_ORDER	
	WHERE TO_CHAR(ORD_DATE, 'Q') = 1
	AND EXTRACT(year FROM ORD_DATE) = EXTRACT(year FROM SYSDATE);

