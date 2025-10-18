# 🛠️ Projeto SQL - Oficina Mecânica

![Status](https://img.shields.io/badge/Status-Concluído-green)
![SQL](https://img.shields.io/badge/SQL-Prática-blue)

---

## 📖 Descrição
Este projeto simula o banco de dados de uma **oficina mecânica**, permitindo prática de **consultas SQL** com foco em:

- Criação de banco e tabelas  
- Inserção de dados de clientes, veículos, mecânicos, equipes, peças e ordens de serviço  
- Consultas com `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `HAVING` e funções de agregação (`SUM`, `COUNT`)  

Desenvolvido para **MySQL Workbench**, sendo ideal para **estudo e prática de SQL**.

---

## 🗂 Estrutura do Arquivo `oficina_mecanica.sql`

| Etapa | Descrição |
|-------|-----------|
| **1. Criação do Banco e Tabelas** | Banco `Oficina_Mecanica` e tabelas: Cliente, Veiculo, Mecanico, Equipe, Equipe_Mecanico, Peca, Ordem_Servico, OS_Peca |
| **2. Inserção de Dados** | Dados fictícios para teste, incluindo clientes, veículos, mecânicos, equipes, peças e ordens de serviço |
| **3. Consultas SQL** | Recuperação simples, filtros, ordenação, contagem, agrupamento, junções e agregação de valores |

---

## ⚡ Como Usar
🔍 Exemplos de Consultas
Recuperação simples
SELECT * FROM Cliente;


Filtro por condição
SELECT * FROM Veiculo
WHERE marca = 'Ford';


Junção entre tabelas
SELECT c.nome AS Cliente, v.modelo AS Veiculo
FROM Cliente c
JOIN Veiculo v ON c.id_cliente = v.id_cliente;


Agrupamento e agregação
SELECT m.nome AS Mecanico, COUNT(os.id_os) AS Total_Ordens
FROM Mecanico m
JOIN Ordem_Servico os ON m.id_mecanico = os.id_mecanico
GROUP BY m.nome
HAVING COUNT(os.id_os) > 2;


🛠 Tecnologias Utilizadas

MySQL 8.0+

MySQL Workbench

💡 Autor

Isabelle Nascimento

📌 Observações

Todos os dados são fictícios, apenas para fins de aprendizado

O projeto é aberto e você pode modificar, testar e expandir conforme necessário.


