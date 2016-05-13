;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname gerencia-hotel) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Projeto: Fundamentos de Algoritmos
;; Período: 2016-1
;; Tarefa: Laboratório 4
;;
;; Responsável: Luiz Gustavo Frozi de Castro e Souza / 96957
;;
;; Changelog: 
;;     * 2016-05-12
;;         - Definição de Estruturas
;;         - Funções para manipulação

(define-struct quarto (numero tipo diaria localizacao))
;; Um elemento quarto do conjunto Quarto é uma estrutura do tipo:
;; (make-querto n t d l)
;; onde:
;; n (number): Número do Quarto
;; t (symbol): Tipo do Quarto, pode ser 'suite ou 'apartamento
;; d (number): Valor da diária, em Reais
;; l (string): Localização
;;
;; Exemplos:
(define q1 (make-quarto 1001 'suite       200.00 "Andar 10, Frente"))
(define q2 (make-quarto  901 'suite       200.00 "Andar 9, Frente"))
(define q3 (make-quarto  110 'apartamento 100.00 "Andar 1, Fundos"))
(define q4 (make-quarto  507 'apartamento 120.00 "Andar 5, Lateral"))

(define-struct abp-quarto-no (quarto esq dir))
;; Uma Abp-quarto é uma Árvore Binária de Pesquisa, cujos nós armazenam informações do tipo Quarto.
;; É ordenado pelo número do quarto.
;; Um Abp-quarto-no é um nó da estrutura Abp-quarto definido como:
;; 1. ou empty
;; 2. ou (make-abp-quarto-no q e d), onde
;;     q (quarto): É um elemento do tipo Quarto
;;     esq (abp-quarto-no): É o próximo quarto, cujo número é menor que o do quarto do nó atual. 
;;     dir (abp-quarto-no): É o próximo quarto, cujo número é maior que o do quarto do nó atual. 
;;
;; Exemplo:
(define apbq1 
    (make-abp-quarto-no 
        q1 
        (make-abp-quarto-no 
            q2
            (make-abp-quarto-no 
                q3
                empty
                (make-abp-quarto-no 
                    q4
                    empty
                    empty
                )
            )
        )
    )
)

(define-struct funcionario (nome cargo salario))
;; Um elemento funcionario do conjunto Funcionario é uma estrutura do tipo:
;; (make-funcionario n c s)
;; onde:
;; n (string): Nome do Funcionário
;; c (string): Cargo do Funcionário
;; s (number): Salário do Funcionário
(define f1 (make-funcionario "Pedro Paulo" "Gerente Geral" 10000.00))
(define f2 (make-funcionario "Maria" "Gerente" 7000.00))
(define f3 (make-funcionario "Ana" "Gerente" 7000.00))
(define f4 (make-funcionario "João" "Carregador" 1000.00))
(define f5 (make-funcionario "Rafael" "Carregador" 1000.00))
(define f6 (make-funcionario "Joana" "Arrumadeira" 1500.00))
(define f7 (make-funcionario "Rosana" "Arrumadeira" 1500.00))
(define f8 (make-funcionario "Cloude" "Chef de Cozinha" 4000.00))
(define f9 (make-funcionario "Carlos" "Cozinheiro" 1500.00))
(define f10 (make-funcionario "Larissa" "Cozinheiro" 1500.00))
(define f11 (make-funcionario "Diego" "Contador" 4000.00))
(define f12 (make-funcionario "Paula" "Recepcionista" 2000.00))
(define f13 (make-funcionario "Laula" "Recepcionista" 2000.00))
(define f14 (make-funcionario "Luiza" "Auxiliar Administrativo" 2000.00))

(define-struct an-funcionario-no (funcionario subordinados))
;; Uma An-funcionario é uma Árvore N, cujos nós armazenam informações do tipo Funcionario.
;; A ordem representa a hierarquia entre os funcionários, onde o chefe está na raiz.
;; Um An-funcionario-no é um nó da estrutura Abp-funcionario definido como:
;; 1. ou empty
;; 2. ou (make-an-funcionario-no f s), onde
;;     f (funcionario): É um elemento do tipo Quarto
;;     s (lista-de-an-funcionario-no): Subordinados do nó atual. 
;;
;; Exemplo:
