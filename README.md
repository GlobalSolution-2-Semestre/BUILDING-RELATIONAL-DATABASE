# 📊 Projeto de Banco de Dados – *MindTrack*  
Sistema de Monitoramento de Humor e Bem-Estar dos Colaboradores

## 📌 Objetivo do Projeto
O objetivo deste trabalho é projetar e implementar um banco de dados relacional capaz de armazenar, gerenciar e analisar informações relacionadas ao bem-estar emocional dos colaboradores de uma organização.

O sistema simula uma plataforma chamada **MindTrack**, que permite:

- Registro de colaboradores  
- Check-ins diários de humor  
- Geração automática de relatórios  
- Emissão de alertas com base no estado emocional  
- Consultas analíticas para apoio à gestão  

Este banco de dados serve como base para sistemas de RH, psicologia organizacional e dashboards gerenciais.

---

## 👥 Integrantes
- **Pedro Henrique Luiz Alves Duarte**  
- **Guilherme Macedo Martins** 

---

## 🏗️ Estrutura do Banco de Dados

O banco foi estruturado em **4 tabelas principais**, com chaves estrangeiras, índices e constraints de validação.

### **1. TB_COLABORADOR**
Armazena dados cadastrais.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| ID_COLABORADOR | NUMBER (PK) | Identificador único |
| NOME | VARCHAR2(100) | Nome do colaborador |
| EMAIL | VARCHAR2(100) | E-mail único + validação |
| CARGO | VARCHAR2(50) | Cargo na empresa |

✔ Possui constraints de validação de email  
✔ Índice para otimização de consultas

---

### **2. TB_CHECKIN**
Registra o humor do colaborador diariamente.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| ID_CHECKIN | NUMBER (PK) | Identificador do check-in |
| ID_COLABORADOR | NUMBER (FK) | Referência ao colaborador |
| DATA_REGISTRO | DATE | Data automática |
| HUMOR | VARCHAR2(50) | Estado emocional |
| COMENTARIO | VARCHAR2(255) | Observações do colaborador |

✔ HUMOR validado via CHECK (“Feliz”, “Cansado”, etc.)

---

### **3. TB_RELATORIO**
Gera resumos do estado emocional do colaborador.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| ID_RELATORIO | NUMBER (PK) | Identificador |
| ID_COLABORADOR | NUMBER (FK) | Relacionamento |
| DATA_GERACAO | DATE | Gerado automaticamente |
| MEDIA_HUMOR | NUMBER(4,2) | Média (0 a 10) |
| RESUMO | VARCHAR2(300) | Análise emocional |

---

### **4. TB_ALERTA**
Alertas emitidos pelo sistema.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| ID_ALERTA | NUMBER (PK) | Identificador |
| ID_COLABORADOR | NUMBER (FK) | Colaborador |
| TIPO_ALERTA | VARCHAR2(80) | Informativo/Aviso/Atenção/Crítico |
| DESCRICAO | VARCHAR2(255) | Descrição do alerta |
| DATA_ENVIO | TIMESTAMP | Data/hora automática |

✔ TIPO_ALERTA validado via CHECK  
✔ Índice para otimização

---

## 📂 Relacionamentos do Banco

- **1 colaborador** → **N check-ins**  
- **1 colaborador** → **N relatórios**  
- **1 colaborador** → **N alertas**  

Chaves estrangeiras:

- TB_CHECKIN.ID_COLABORADOR → TB_COLABORADOR  
- TB_RELATORIO.ID_COLABORADOR → TB_COLABORADOR  
- TB_ALERTA.ID_COLABORADOR → TB_COLABORADOR  

---

## 🧪 População das Tabelas

O banco foi populado com:

- 10 colaboradores  
- 10 check-ins reais simulados  
- 10 relatórios com médias calculadas  
- 10 alertas de diferentes níveis  

Esses dados permitem validar consultas e gerar insights.

