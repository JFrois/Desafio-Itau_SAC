--- Criacao tabela gastos
CREATE TABLE GASTOS (
	ID SERIAL PRIMARY KEY,
	NM_CLIENTE VARCHAR(255),
	VALOR_OPERACAO NUMERIC(18, 2),
	NUM_PARCELAS INTEGER,
	DT_OPERACAO DATE,
	MES_ATUAL DATE
);

--- Criacao tabela limites
CREATE TABLE LIMITES (
	ID SERIAL PRIMARY KEY,
	CLIENTE VARCHAR(255),
	LIMITE NUMERIC(18, 2),
	DT_VENCIMENTO DATE
);

--- Atualizacao dados gastos
INSERT INTO
	GASTOS (
		NM_CLIENTE,
		VALOR_OPERACAO,
		NUM_PARCELAS,
		DT_OPERACAO,
		MES_ATUAL
	)
VALUES
	(
		TRIM(UPPER('Paulo Gomes')),
		855.00,
		5,
		'2022-01-01',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		504.18,
		2,
		'2022-01-01',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		970.00,
		5,
		'2022-01-01',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		2010.31,
		7,
		'2022-01-01',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		465.00,
		1,
		'2022-01-01',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		465.50,
		4,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		2107.00,
		5,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		1071.67,
		1,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		382.67,
		2,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		889.00,
		10,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		385.00,
		1,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		384.00,
		2,
		'2022-01-02',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		692.00,
		1,
		'2022-01-03',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		115.00,
		5,
		'2022-01-03',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Pedro Ribeira')),
		135.00,
		5,
		'2022-01-03',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		354.00,
		1,
		'2022-01-03',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		243.42,
		5,
		'2022-01-03',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		734.85,
		5,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		265.62,
		5,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Patrícia Pereira')),
		175.00,
		3,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		1916.53,
		10,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Fernanda Oliveira')),
		468.75,
		3,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		598.40,
		5,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		172.75,
		1,
		'2022-01-04',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		359.53,
		5,
		'2022-01-05',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		620.41,
		4,
		'2022-01-05',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		216.97,
		5,
		'2022-01-05',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		773.42,
		1,
		'2022-01-05',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		343.08,
		4,
		'2022-01-05',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		443.72,
		5,
		'2022-01-06',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		343.00,
		4,
		'2022-01-06',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		2644.30,
		10,
		'2022-01-06',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		559.36,
		2,
		'2022-01-06',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		234.00,
		5,
		'2022-01-06',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		1121.98,
		7,
		'2022-01-07',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		205.00,
		4,
		'2022-01-07',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		673.12,
		1,
		'2022-01-07',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		110.66,
		5,
		'2022-01-07',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		187.21,
		2,
		'2022-01-07',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		666.00,
		2,
		'2022-01-08',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		1046.00,
		6,
		'2022-01-08',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		652.44,
		5,
		'2022-01-08',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		513.76,
		4,
		'2022-01-08',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		440.25,
		2,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		165.00,
		4,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		310.67,
		2,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		385.50,
		2,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Patrícia Pereira')),
		1363.96,
		3,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		753.04,
		2,
		'2022-01-09',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		130.00,
		1,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		740.89,
		5,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		411.00,
		5,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		321.97,
		4,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Pedro Ribeira')),
		941.33,
		8,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		1334.62,
		7,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		1228.00,
		2,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		281.00,
		1,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		437.29,
		4,
		'2022-01-10',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		745.00,
		3,
		'2022-01-11',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		1274.40,
		4,
		'2022-01-11',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		379.59,
		4,
		'2022-01-11',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		485.00,
		2,
		'2022-01-11',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Fernanda Oliveira')),
		225.19,
		3,
		'2022-01-11',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		208.96,
		4,
		'2022-01-12',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		1113.00,
		1,
		'2022-01-12',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		1749.67,
		1,
		'2022-01-12',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		532.77,
		5,
		'2022-01-12',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Fernanda Oliveira')),
		1304.45,
		3,
		'2022-01-12',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		764.42,
		3,
		'2022-01-13',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		331.00,
		5,
		'2022-01-13',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		764.00,
		4,
		'2022-01-13',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		2036.00,
		3,
		'2022-01-14',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		549.00,
		1,
		'2022-01-14',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		2081.00,
		1,
		'2022-01-14',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		63.88,
		1,
		'2022-01-14',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		1121.00,
		8,
		'2022-01-15',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		608.00,
		2,
		'2022-01-15',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		441.00,
		3,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		611.00,
		4,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		108.00,
		5,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		471.00,
		5,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		761.55,
		4,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		1936.00,
		2,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Patrícia Pereira')),
		367.44,
		5,
		'2022-01-16',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		288.57,
		3,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		372.52,
		2,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		1212.16,
		3,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		744.00,
		1,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		364.00,
		2,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		867.00,
		8,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		613.30,
		5,
		'2022-01-17',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		1267.10,
		10,
		'2022-01-18',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		315.31,
		2,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		431.00,
		2,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		408.13,
		2,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		167.00,
		3,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		723.84,
		1,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		703.02,
		4,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Fernanda Oliveira')),
		568.10,
		2,
		'2022-01-19',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		465.32,
		5,
		'2022-01-20',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		174.00,
		2,
		'2022-01-20',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		398.55,
		5,
		'2022-01-20',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Lucas Oliveira')),
		425.00,
		3,
		'2022-01-20',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		290.06,
		5,
		'2022-01-21',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		495.00,
		4,
		'2022-01-22',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		791.90,
		1,
		'2022-01-22',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		2720.00,
		5,
		'2022-01-22',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		654.00,
		5,
		'2022-01-22',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		700.97,
		1,
		'2022-01-23',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		531.69,
		4,
		'2022-01-23',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		114.00,
		2,
		'2022-01-23',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		553.34,
		5,
		'2022-01-23',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		594.77,
		1,
		'2022-01-24',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		4398.00,
		8,
		'2022-01-24',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		481.97,
		3,
		'2022-01-24',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		727.12,
		1,
		'2022-01-24',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		549.57,
		3,
		'2022-01-24',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		214.00,
		4,
		'2022-01-25',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		1464.84,
		2,
		'2022-01-25',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		1057.92,
		1,
		'2022-01-25',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		1093.00,
		7,
		'2022-01-25',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Patrícia Pereira')),
		265.00,
		5,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		1819.00,
		1,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		176.08,
		5,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		922.08,
		7,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		3504.00,
		9,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		247.98,
		3,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		353.03,
		1,
		'2022-01-26',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		614.62,
		1,
		'2022-01-27',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		371.99,
		1,
		'2022-01-27',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		155.56,
		4,
		'2022-01-27',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		598.92,
		1,
		'2022-01-28',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Sandra Souza')),
		233.60,
		5,
		'2022-01-28',
		'2022-01-01'
	),
	(
		TRIM(UPPER('José Silva')),
		839.10,
		11,
		'2022-01-28',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Marcos Souza')),
		263.11,
		3,
		'2022-01-28',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		2056.00,
		1,
		'2022-01-28',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Pedro Ribeira')),
		294.69,
		4,
		'2022-01-29',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		433.00,
		4,
		'2022-01-29',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Ana Costa')),
		1113.58,
		9,
		'2022-01-29',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		203.01,
		3,
		'2022-01-29',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Maria Alves')),
		683.63,
		4,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		1680.00,
		9,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		148.37,
		4,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('João Silva')),
		659.68,
		4,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Camila Santos')),
		702.00,
		3,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Adriana Pereira')),
		1084.58,
		10,
		'2022-01-30',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Luiz Alves')),
		202.00,
		5,
		'2022-01-31',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Antônio Oliveira')),
		188.42,
		5,
		'2022-01-31',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Paulo Gomes')),
		874.00,
		3,
		'2022-01-31',
		'2022-01-01'
	),
	(
		TRIM(UPPER('Pedro Ribeira')),
		724.36,
		4,
		'2022-01-31',
		'2022-01-01'
	);

--- Atualizacao limmites
INSERT INTO
	LIMITES (CLIENTE, LIMITE, DT_VENCIMENTO)
VALUES
	(TRIM(UPPER('JOÃO SILVA')), 2575.00, '2022-01-25'),
	(TRIM(UPPER('JOSÉ SILVA')), 4500.00, '2022-01-05'),
	(
		TRIM(UPPER('Antônio Oliveira')),
		2325.00,
		'2022-01-25'
	),
	(
		TRIM(UPPER('Francisco Santos')),
		375.00,
		'2022-01-25'
	),
	(
		TRIM(UPPER('Carlos Rodrigues')),
		2675.00,
		'2022-01-05'
	),
	(
		TRIM(UPPER('PEDRO RIBEIRA')),
		1800.00,
		'2022-01-05'
	),
	(TRIM(UPPER('Paulo Gomes')), 4725.00, '2022-01-25'),
	(
		TRIM(UPPER('LUCAS OLIVEIRA')),
		525.00,
		'2022-01-15'
	),
	(TRIM(UPPER('LUIZ ALVES')), 2575.00, '2022-01-25'),
	(
		TRIM(UPPER('Marcos Souza')),
		3050.00,
		'2022-01-25'
	),
	(TRIM(UPPER('MARIA ALVES')), 5275.00, '2022-01-25'),
	(TRIM(UPPER('ANA COSTA')), 5375.00, '2022-01-25'),
	(
		TRIM(UPPER('Adriana Pereira')),
		1875.00,
		'2022-01-05'
	),
	(
		TRIM(UPPER('Juliana Costa')),
		5075.00,
		'2022-01-25'
	),
	(
		TRIM(UPPER('Márcia Silva')),
		2200.00,
		'2022-01-15'
	),
	(
		TRIM(UPPER('Fernanda Oliveira')),
		2925.00,
		'2022-01-05'
	),
	(
		TRIM(UPPER('Patrícia Pereira')),
		2500.00,
		'2022-01-15'
	),
	(
		TRIM(UPPER('Aline Rodrigues')),
		2600.00,
		'2022-01-15'
	),
	(
		TRIM(UPPER('SANDRA SOUZA')),
		3800.00,
		'2022-01-15'
	),
	(
		TRIM(UPPER('Camila Santos')),
		3275.00,
		'2022-01-15'
	);

--- Selecao geral
SELECT
	G.ID,
	G.NM_CLIENTE,
	G.VALOR_OPERACAO,
	G.NUM_PARCELAS,
	G.DT_OPERACAO,
	G.MES_ATUAL,
	L.LIMITE,
	L.DT_VENCIMENTO,
	L.CLIENTE
FROM
	GASTOS G
	INNER JOIN LIMITES L ON G.NM_CLIENTE = L.CLIENTE
ORDER BY
	G.NM_CLIENTE;

--- Selecao por nome
SELECT
	G.ID,
	G.NM_CLIENTE,
	L.LIMITE,
	G.VALOR_OPERACAO,
	G.NUM_PARCELAS,
	G.DT_OPERACAO,
	G.MES_ATUAL,
	L.DT_VENCIMENTO,
	L.CLIENTE
FROM
	GASTOS G
	INNER JOIN LIMITES L ON G.NM_CLIENTE = L.CLIENTE
WHERE
	G.NM_CLIENTE = 'ADRIANA PEREIRA' --- Aqui acontece a alteracao para o que queremos
ORDER BY
	G.NM_CLIENTE;

--- Selecao por valor minimo de gasto
SELECT
	G.ID,
	G.NM_CLIENTE,
	L.LIMITE,
	G.VALOR_OPERACAO,
	G.NUM_PARCELAS,
	G.DT_OPERACAO,
	G.MES_ATUAL,
	L.DT_VENCIMENTO,
	L.CLIENTE
FROM
	GASTOS G
	INNER JOIN LIMITES L ON G.NM_CLIENTE = L.CLIENTE
WHERE
	G.VALOR_OPERACAO >= 700.00 --- Aqui acontece a alteracao para o que queremos, para trazer valores iguais ou maiores
ORDER BY
	G.NM_CLIENTE;

--- Selecao por range data
SELECT
	G.ID,
	G.NM_CLIENTE,
	L.LIMITE,
	G.VALOR_OPERACAO,
	G.NUM_PARCELAS,
	G.DT_OPERACAO,
	G.MES_ATUAL,
	L.DT_VENCIMENTO,
	L.CLIENTE
FROM
	GASTOS G
	INNER JOIN LIMITES L ON G.NM_CLIENTE = L.CLIENTE
WHERE
	G.DT_OPERACAO BETWEEN '2022-01-01' AND '2022-01-10' --- Aqui acontece a alteracao para o que queremos, para trazer valores iguais ou maiores
ORDER BY
	G.NM_CLIENTE;

--- Selecao top 5 gastos por cliente
SELECT
	G.NM_CLIENTE,
	SUM(G.VALOR_OPERACAO) AS TOTAL_GASTO,
	L.LIMITE
FROM
	GASTOS G
	INNER JOIN LIMITES L ON G.NM_CLIENTE = L.CLIENTE
GROUP BY
	G.NM_CLIENTE,
	L.LIMITE
ORDER BY
	TOTAL_GASTO DESC -- Ordena pela soma total, não por um valor individual
LIMIT
	5;

--- Selecao top 5 meses mais gastos
SELECT
	EXTRACT(
		DAY
		FROM
			G.DT_OPERACAO
	) AS DIA,
	EXTRACT(
		YEAR
		FROM
			G.DT_OPERACAO
	) AS ANO,
	EXTRACT(
		MONTH
		FROM
			G.DT_OPERACAO
	) AS MES,
	SUM(G.VALOR_OPERACAO) AS TOTAL_GASTO
FROM
	GASTOS G
	-- Não precisamos da tabela LIMITES para esta pergunta
GROUP BY
	DIA,
	ANO,
	MES -- Agrupa todas as transações do mesmo mês/ano
ORDER BY
	TOTAL_GASTO DESC -- Ordena pelo total gasto no mês
LIMIT
	5;