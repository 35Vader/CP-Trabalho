\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp2021t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\definecolor{red}{RGB}{255,  0,  0}
\definecolor{blue}{RGB}{0,0,255}
\def\red{\color{red}}
\def\blue{\color{blue}}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp2021t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format .=?=. = "\mathbin{\stackrel{\mathrm{?}}{=}}"
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format <$> = "\mathbin{\mathopen{\langle}\$\mathclose{\rangle}}"
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (cata (f)) = "\cata{" f "}"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format Rational = "\Q "
%format toRational = " to_\Q "
%format fromRational = " from_\Q "
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (curry (f)) = "\overline{" f "}"
%format (cataLTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (anaLTree (x)) = "\mathopen{[\!(}" x "\mathclose{)\!]}"
%format delta = "\Delta "

%---------------------------------------------------------------------------

\title{
       	Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2020/21
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 27
\\\hline
a89559 & Alberto Leal Fernandes	
\\
a89521 & Alexandra Dias Candeias	
\\
a89607 & João Paulo Ribeiro Pereira	
\\
a89570 & Tiago Carvalho Freitas	
\end{tabular}
\end{center}

\section{Preâmbulo}

\CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, opta-se pela aplicação deste método à programação
em \Haskell\ (sem prejuízo da sua aplicação a outras linguagens 
funcionais). Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, a validá-los e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
%
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote}
%
Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp2021t.pdf} que está a ler é já um exemplo de
\litp{programação literária}: foi gerado a partir do texto fonte
\texttt{cp2021t.lhs}\footnote{O suffixo `lhs' quer dizer
\emph{\lhaskell{literate Haskell}}.} que encontrará no
\MaterialPedagogico\ desta disciplina descompactando o ficheiro
\texttt{cp2021t.zip} e executando:
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp2021t.lhs > cp2021t.tex
    $ pdflatex cp2021t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex --lib
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp2021t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp2021t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Main where 
import Cp
import List hiding (fac)
import Nat
import LTree
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Control.Monad
import Control.Applicative hiding ((<|>))
import System.Process
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp2021t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
é seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de 3 (ou 4) alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp2021t.aux
    $ makeindex cp2021t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss --lib
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode-se ainda controlar o número de casos de teste e sua complexidade,
como o seguinte exemplo mostra:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\subsection{Stack}

O \stack{Stack} é um programa útil para criar, gerir e manter projetos em \Haskell.
Um projeto criado com o Stack possui uma estrutura de pastas muito específica:

\begin{itemize}
\item Os módulos auxiliares encontram-se na pasta \emph{src}.
\item O módulos principal encontra-se na pasta \emph{app}.
\item A lista de depêndencias externas encontra-se no ficheiro \emph{package.yaml}.
\end{itemize}

Pode aceder ao \GHCi\ utilizando o comando:
\begin{verbatim}
stack ghci
\end{verbatim}

Garanta que se encontra na pasta mais externa \textbf{do projeto}.
A primeira vez que correr este comando as depêndencias externas serão instaladas automaticamente.

Para gerar o PDF, garanta que se encontra na diretoria \emph{app}.

\Problema

Os \emph{tipos de dados algébricos} estudados ao longo desta disciplina oferecem
uma grande capacidade expressiva ao programador. Graças à sua flexibilidade,
torna-se trivial implementar \DSL s
e até mesmo \href{http://www.cse.chalmers.se/~ulfn/papers/thesis.pdf}{linguagens de programação}.

Paralelamente, um tópico bastante estudado no âmbito de \DL\ 
é a derivação automática de expressões matemáticas, por exemplo, de derivadas.
Duas técnicas que podem ser utilizadas para o cálculo de derivadas são:

\begin{itemize}
\item \emph{Symbolic differentiation}
\item \emph{Automatic differentiation}
\end{itemize}

\emph{Symbolic differentiation} consiste na aplicação sucessiva de transformações
(leia-se: funções) que sejam congruentes com as regras de derivação. O resultado
final será a expressão da derivada.

O leitor atento poderá notar um problema desta técnica: a expressão
inicial pode crescer de forma descontrolada, levando a um cálculo pouco eficiente.
\emph{Automatic differentiation} tenta resolver este problema,
calculando \textbf{o valor} da derivada da expressão em todos os passos.
Para tal, é necessário calcular o valor da expressão \textbf{e} o valor da sua derivada.

Vamos de seguida definir uma linguagem de expressões matemáticas simples e
implementar as duas técnicas de derivação automática.
Para isso, seja dado o seguinte tipo de dados,

\begin{code}
data ExpAr a = X
           | N a
           | Bin BinOp (ExpAr a) (ExpAr a)
           | Un UnOp (ExpAr a)
           deriving (Eq, Show)
\end{code}

\noindent
onde |BinOp| e |UnOp| representam operações binárias e unárias, respectivamente:

\begin{code}
data BinOp = Sum
           | Product
           deriving (Eq, Show)

data UnOp = Negate
          | E
          deriving (Eq, Show)
\end{code}

\noindent
O construtor |E| simboliza o exponencial de base $e$.

Assim, cada expressão pode ser uma variável, um número, uma operação binária
aplicada às devidas expressões, ou uma operação unária aplicada a uma expressão.
Por exemplo,
\begin{spec}
Bin Sum X (N 10)
\end{spec}
designa |x+10| na notação matemática habitual.

\begin{enumerate}
\item A definição das funções |inExpAr| e |baseExpAr| para este tipo é a seguinte:
\begin{code}
inExpAr = either (const X) num_ops where
  num_ops = either N ops
  ops     = either bin (uncurry Un)
  bin(op, (a, b)) = Bin op a b

baseExpAr f g h j k l z = f -|- (g -|- (h >< (j >< k) -|- l >< z))
\end{code}

  Defina as funções |outExpAr| e |recExpAr|,
  e teste as propriedades que se seguem.
  \begin{propriedade}
    |inExpAr| e |outExpAr| são testemunhas de um isomorfismo,
    isto é,
    |inExpAr . outExpAr = id| e |outExpAr . idExpAr = id|:
\begin{code}
prop_in_out_idExpAr :: (Eq a) => ExpAr a -> Bool
prop_in_out_idExpAr = inExpAr . outExpAr .==. id

prop_out_in_idExpAr :: (Eq a) => OutExpAr a -> Bool
prop_out_in_idExpAr = outExpAr . inExpAr .==. id
\end{code}
    \end{propriedade}

  \item Dada uma expressão aritmética e um escalar para substituir o |X|,
	a função

\begin{quote}
      |eval_exp :: Floating a => a -> (ExpAr a) -> a|
\end{quote}

\noindent calcula o resultado da expressão. Na página \pageref{pg:P1}
    esta função está expressa como um catamorfismo. Defina o respectivo gene
    e, de seguida, teste as propriedades:
    \begin{propriedade}
       A função |eval_exp| respeita os elementos neutros das operações.
\begin{code}
prop_sum_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idr a exp = eval_exp a exp .=?=. sum_idr where
  sum_idr = eval_exp a (Bin Sum exp (N 0))

prop_sum_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idl a exp = eval_exp a exp .=?=. sum_idl where
  sum_idl = eval_exp a (Bin Sum (N 0) exp)

prop_product_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idr a exp = eval_exp a exp .=?=. prod_idr where
  prod_idr = eval_exp a (Bin Product exp (N 1))

prop_product_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idl a exp = eval_exp a exp .=?=. prod_idl where
  prod_idl = eval_exp a (Bin Product (N 1) exp)

prop_e_id :: (Floating a, Real a) => a -> Bool
prop_e_id a = eval_exp a (Un E (N 1)) == expd 1

prop_negate_id :: (Floating a, Real a) => a -> Bool
prop_negate_id a = eval_exp a (Un Negate (N 0)) == 0
\end{code}
    \end{propriedade}
    \begin{propriedade}
      Negar duas vezes uma expressão tem o mesmo valor que não fazer nada.
\begin{code}
prop_double_negate :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_double_negate a exp = eval_exp a exp .=?=. eval_exp a (Un Negate (Un Negate exp))
\end{code}
    \end{propriedade}

  \item É possível otimizar o cálculo do valor de uma expressão aritmética tirando proveito
  dos elementos absorventes de cada operação. Implemente os genes da função
\begin{spec}
      optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
\end{spec}
  que se encontra na página \pageref{pg:P1} expressa como um hilomorfismo\footnote{Qual é a vantagem de implementar a função |optimize_eval| utilizando um hilomorfismo em vez de utilizar um catamorfismo com um gene "inteligente"?}
  e teste as propriedades:

    \begin{propriedade}
      A função |optimize_eval| respeita a semântica da função |eval|.
\begin{code}
prop_optimize_respects_semantics :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_optimize_respects_semantics a exp = eval_exp a exp .=?=. optmize_eval a exp
\end{code}
    \end{propriedade}


\item Para calcular a derivada de uma expressão, é necessário aplicar transformações
à expressão original que respeitem as regras das derivadas:\footnote{%
	Apesar da adição e multiplicação gozarem da propriedade comutativa,
	há que ter em atenção a ordem das operações por causa dos testes.}

\begin{itemize}
  \item Regra da soma:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)+g(x))=\frac{d}{dx}(f(x))+\frac{d}{dx}(g(x))
\end{eqnarray*}
  \item Regra do produto:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)g(x))=f(x)\cdot \frac{d}{dx}(g(x))+\frac{d}{dx}(f(x))\cdot g(x)
\end{eqnarray*}
\end{itemize}

  Defina o gene do catamorfismo que ocorre na função
    \begin{quote}
      |sd :: Floating a => ExpAr a -> ExpAr a|
    \end{quote}
  que, dada uma expressão aritmética, calcula a sua derivada.
  Testes a fazer, de seguida:
    \begin{propriedade}
       A função |sd| respeita as regras de derivação.
\begin{code}
prop_const_rule :: (Real a, Floating a) => a -> Bool
prop_const_rule a = sd (N a) == N 0

prop_var_rule :: Bool
prop_var_rule = sd X == N 1

prop_sum_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_sum_rule exp1 exp2 = sd (Bin Sum exp1 exp2) == sum_rule where
  sum_rule = Bin Sum (sd exp1) (sd exp2)

prop_product_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_product_rule exp1 exp2 = sd (Bin Product exp1 exp2) == prod_rule where
  prod_rule =Bin Sum (Bin Product exp1 (sd exp2)) (Bin Product (sd exp1) exp2)

prop_e_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_e_rule exp = sd (Un E exp) == Bin Product (Un E exp) (sd exp)

prop_negate_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_negate_rule exp = sd (Un Negate exp) == Un Negate (sd exp)
\end{code}
    \end{propriedade}

\item Como foi visto, \emph{Symbolic differentiation} não é a técnica
mais eficaz para o cálculo do valor da derivada de uma expressão.
\emph{Automatic differentiation} resolve este problema cálculando o valor
da derivada em vez de manipular a expressão original.

  Defina o gene do catamorfismo que ocorre na função
    \begin{spec}
    ad :: Floating a => a -> ExpAr a -> a
    \end{spec}
  que, dada uma expressão aritmética e um ponto,
  calcula o valor da sua derivada nesse ponto,
  sem transformar manipular a expressão original.
  Testes a fazer, de seguida:

    \begin{propriedade}
       Calcular o valor da derivada num ponto |r| via |ad| é equivalente a calcular a derivada da expressão e avalia-la no ponto |r|.
\begin{code}
prop_congruent :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_congruent a exp = ad a exp .=?=. eval_exp a (sd exp)
\end{code}
    \end{propriedade}
\end{enumerate}

\Problema

Nesta disciplina estudou-se como fazer \pd{programação dinâmica} por cálculo,
recorrendo à lei de recursividade mútua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, página \pageref{eq:fokkinga}.}

Para o caso de funções sobre os números naturais (|Nat0|, com functor |fF
X = 1 + X|) é fácil derivar-se da lei que foi estudada uma
	\emph{regra de algibeira}
	\label{pg:regra}
que se pode ensinar a programadores que não tenham estudado
\cp{Cálculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
cálculo do ciclo-\textsf{for} que implementa a função de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-á de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item	O corpo do ciclo |loop| terá tantos argumentos quanto o número de funções mutuamente recursivas.
\item	Para as variáveis escolhem-se os próprios nomes das funções, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros símbolos, mas numa primeira leitura
dá jeito usarem-se tais nomes.}
\item	Para os resultados vão-se buscar as expressões respectivas, retirando a variável |n|.
\item	Em |init| coleccionam-se os resultados dos casos de base das funções, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polinómios do segundo grau $ax^2 + b x + c$ em |Nat0|.
Seguindo o método estudado nas aulas\footnote{Secção 3.17 de \cite{Ol18} e tópico
\href{https://www4.di.uminho.pt/~jno/media/cp/}{Recursividade mútua} nos vídeos das aulas teóricas.},
de $f\ x = a x^2 + b x + c$ derivam-se duas funções mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementação, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b) 
\end{code}
O que se pede então, nesta pergunta?
Dada a fórmula que dá o |n|-ésimo \catalan{número de Catalan},
\begin{eqnarray}
	C_n = \frac{(2n)!}{(n+1)! (n!) }
	\label{eq:cat}
\end{eqnarray}
derivar uma implementação de $C_n$ que não calcule factoriais nenhuns.
Isto é, derivar um ciclo-\textsf{for}
\begin{spec}
cat = cdots . for loop init where cdots
\end{spec}
que implemente esta função.

\begin{propriedade}
A função proposta coincidem com a definição dada:
\begin{code}
prop_cat = (>=0) .==>. (catdef  .==. cat)
\end{code}
\end{propriedade}
%
\textbf{Sugestão}: Começar por estudar muito bem o processo de cálculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da função exponencial.


\Problema 

As \bezier{curvas de Bézier}, designação dada em honra ao engenheiro
\href{https://en.wikipedia.org/wiki/Pierre_B%C3%A9zier}{Pierre Bézier},
são curvas ubíquas na área de computação gráfica, animação e modelação.
Uma curva de Bézier é uma curva paramétrica, definida por um conjunto
$\{P_0,...,P_N\}$ de pontos de controlo, onde $N$ é a ordem da curva.

\begin{figure}[h!]
  \centering
  \includegraphics[width=0.8\textwidth]{cp2021t_media/Bezier_curves.png}
  \caption{Exemplos de curvas de Bézier retirados da \bezier{ Wikipedia}.}
\end{figure}

O algoritmo de \emph{De Casteljau} é um método recursivo capaz de calcular
curvas de Bézier num ponto. Apesar de ser mais lento do que outras abordagens,
este algoritmo é numericamente mais estável, trocando velocidade por correção.

De forma sucinta, o valor de uma curva de Bézier de um só ponto $\{P_0\}$
(ordem $0$) é o próprio ponto $P_0$. O valor de uma curva de Bézier de ordem
$N$ é calculado através da interpolação linear da curva de Bézier dos primeiros
$N-1$ pontos e da curva de Bézier dos últimos $N-1$ pontos.

A interpolação linear entre 2 números, no intervalo $[0, 1]$, é dada pela
seguinte função:

\begin{code}
linear1d :: Rational -> Rational -> OverTime Rational
linear1d a b = formula a b where
  formula :: Rational -> Rational -> Float -> Rational
  formula x y t = ((1.0 :: Rational) - (toRational t)) * x + (toRational t) * y
\end{code}
%
A interpolação linear entre 2 pontos de dimensão $N$ é calculada através
da interpolação linear de cada dimensão.

O tipo de dados |NPoint| representa um ponto com $N$ dimensões.
\begin{code}
type NPoint = [Rational]
\end{code}
Por exemplo, um ponto de 2 dimensões e um ponto de 3 dimensões podem ser
representados, respetivamente, por:
\begin{spec}
p2d = [1.2, 3.4]
p3d = [0.2, 10.3, 2.4]
\end{spec}
%
O tipo de dados |OverTime a| representa um termo do tipo |a| num dado instante
(dado por um |Float|).
\begin{code}
type OverTime a = Float -> a
\end{code}
%
O anexo \ref{sec:codigo} tem definida a função 
    \begin{spec}
    calcLine :: NPoint -> (NPoint -> OverTime NPoint)
    \end{spec}
que calcula a interpolação linear entre 2 pontos, e a função
    \begin{spec}
    deCasteljau :: [NPoint] -> OverTime NPoint
    \end{spec}
que implementa o algoritmo respectivo.

\begin{enumerate}

\item Implemente |calcLine| como um catamorfismo de listas,
testando a sua definição com a propriedade:
    \begin{propriedade} Definição alternativa.
\begin{code}
prop_calcLine_def :: NPoint -> NPoint -> Float -> Bool
prop_calcLine_def p q d = calcLine p q d ==  zipWithM linear1d p q d
\end{code}
    \end{propriedade}

\item Implemente a função |deCasteljau| como um hilomorfismo, testando agora a propriedade:
    \begin{propriedade}
      Curvas de Bézier são simétricas.
\begin{code}
prop_bezier_sym :: [[Rational]] -> Gen Bool
prop_bezier_sym l = all (< delta) . calc_difs . bezs <$> elements ps  where
  calc_difs = (\(x, y) -> zipWith (\w v -> if w >= v then w - v else v - w) x y)
  bezs t    = (deCasteljau l t, deCasteljau (reverse l) (fromRational (1 - (toRational t))))
  delta = 1e-2
\end{code}
    \end{propriedade}

  \item Corra a função |runBezier| e aprecie o seu trabalho\footnote{%
        A representação em Gloss é uma adaptação de um
        \href{https://github.com/hrldcpr/Bezier.hs}{projeto}
        de Harold Cooper.} clicando na janela que é aberta (que contém, a verde, um ponto
        inicila) com o botão esquerdo do rato para adicionar mais pontos.
        A tecla |Delete| apaga o ponto mais recente.

\end{enumerate}

\Problema

Seja dada a fórmula que calcula a média de uma lista não vazia $x$,
\begin{equation}
avg\ x = \frac 1 k\sum_{i=1}^{k} x_i
\end{equation}
onde $k=length\ x$. Isto é, para sabermos a média de uma lista precisamos de dois catamorfismos: o que faz o somatório e o que calcula o comprimento a lista.
Contudo, é facil de ver que
\begin{quote}
	$avg\ [a]=a$
\\
	$avg (a:x) = \frac 1 {k+1}(a+\sum_{i=1}^{k} x_i) = \frac{a+k(avg\ x)}{k+1}$ para $k=length\ x$
\end{quote}
Logo $avg$ está em recursividade mútua com $length$ e o par de funções pode ser expresso por um único catamorfismo, significando que a lista apenas é percorrida uma vez.

\begin{enumerate}

\item	Recorra à lei de recursividade mútua para derivar a função
|avg_aux = cata (either b q)| tal que 
|avg_aux = split avg length| em listas não vazias. 

\item	Generalize o raciocínio anterior para o cálculo da média de todos os elementos de uma \LTree\ recorrendo a uma única travessia da árvore (i.e.\ catamorfismo).

\end{enumerate}
Verifique as suas funções testando a propriedade seguinte:
\begin{propriedade}
A média de uma lista não vazia e de uma \LTree\ com os mesmos elementos coincide,
a menos de um erro de 0.1 milésimas:
\begin{code}
prop_avg :: [Double] -> Property
prop_avg = nonempty .==>. diff .<=. const 0.000001 where
   diff l = avg l - (avgLTree . genLTree) l
   genLTree = anaLTree lsplit
   nonempty = (>[]) 
\end{code}
\end{propriedade}

\Problema	(\textbf{NB}: Esta questão é \textbf{opcional} e funciona como \textbf{valorização} apenas para os alunos que desejarem fazê-la.) 

\vskip 1em \noindent
Existem muitas linguagens funcionais para além do \Haskell, que é a linguagem usada neste trabalho prático. Uma delas é o \Fsharp\ da Microsoft. Na directoria \verb!fsharp! encontram-se os módulos \Cp, \Nat\ e \LTree\ codificados em \Fsharp. O que se pede é a biblioteca \BTree\ escrita na mesma linguagem.

Modo de execução: o código que tiverem produzido nesta pergunta deve ser colocado entre o \verb!\begin{verbatim}! e o \verb!\end{verbatim}! da correspondente parte do anexo \ref{sec:resolucao}. Para além disso, os grupos podem demonstrar o código na oral.

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Como primeiro exemplo, estudar o texto fonte deste trabalho para obter o
efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programação dinâmica por recursividade múltipla}\label{sec:recmul}
Neste anexo dão-se os detalhes da resolução do Exercício \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, página \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o cálculo da aproximação até |i=n| da função exponencial $exp\ x = e^x$,
via série de Taylor:
\begin{eqnarray}
	exp\ x 
& = &
	\sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a função que dá essa aproximação.
É fácil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
mútua. Se repetirmos o processo para |h x n| etc obteremos no total três funções nessa mesma
situação:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na página \ref{pg:regra} deste enunciado,
ter-se-á, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}

\begin{code}
expd :: Floating a => a -> a
expd = Prelude.exp

type OutExpAr a = Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
\end{code}

\subsection*{Problema 2}
Definição da série de Catalan usando factoriais (\ref{eq:cat}):
\begin{code}
catdef n = div (fac((2*n))) ((fac((n+1))*(fac n)))
\end{code}
Oráculo para inspecção dos primeiros 26 números de Catalan\footnote{Fonte:
\catalan{Wikipedia}.}:
\begin{code}
oracle = [
    1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845,
    35357670, 129644790, 477638700, 1767263190, 6564120420, 24466267020,
    91482563640, 343059613650, 1289904147324, 4861946401452
    ]
\end{code}

\subsection*{Problema 3}
Algoritmo:
\begin{spec}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] = nil
deCasteljau [p] = const p
deCasteljau l = \pt -> (calcLine (p pt) (q pt)) pt where
  p = deCasteljau (init l)
  q = deCasteljau (tail l)
\end{spec}
Função auxiliar:
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(p:x) = curry g p (calcLine x) where
   g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
   g (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{spec}
2D:
\begin{code}
bezier2d :: [NPoint] -> OverTime (Float, Float)
bezier2d [] = const (0, 0)
bezier2d l = \z -> (fromRational >< fromRational) . (\[x, y] -> (x, y)) $ ((deCasteljau l) z)
\end{code}
Modelo:
\begin{code}
data World = World { points :: [NPoint]
                   , time :: Float
                   }
initW :: World
initW = World [] 0

tick :: Float -> World -> World
tick dt world = world { time=(time world) + dt }

actions :: Event -> World -> World
actions (EventKey (MouseButton LeftButton) Down _ p) world =
  world {points=(points world) ++ [(\(x, y) -> map toRational [x, y]) p]}
actions (EventKey (SpecialKey KeyDelete) Down _ _) world =
    world {points = cond (== []) id init (points world)}
actions _ world = world

scaleTime :: World -> Float
scaleTime w = (1 + cos (time w)) / 2

bezier2dAtTime :: World -> (Float, Float)
bezier2dAtTime w = (bezier2dAt w) (scaleTime w)

bezier2dAt :: World -> OverTime (Float, Float)
bezier2dAt w = bezier2d (points w)

thicCirc :: Picture
thicCirc = ThickCircle 4 10

ps :: [Float]
ps = map fromRational ps' where
  ps' :: [Rational]
  ps' = [0, 0.01..1] -- interval
\end{code}
Gloss:
\begin{code}
picture :: World -> Picture
picture world = Pictures
  [ animateBezier (scaleTime world) (points world)
  , Color white . Line . map (bezier2dAt world) $ ps
  , Color blue . Pictures $ [Translate (fromRational x) (fromRational y) thicCirc | [x, y] <- points world]
  , Color green $ Translate cx cy thicCirc
  ] where
  (cx, cy) = bezier2dAtTime world
\end{code}
Animação:
\begin{code}
animateBezier :: Float -> [NPoint] -> Picture
animateBezier _ [] = Blank
animateBezier _ [_] = Blank
animateBezier t l = Pictures
  [ animateBezier t (init l)
  , animateBezier t (tail l)
  , Color red . Line $ [a, b]
  , Color orange $ Translate ax ay thicCirc
  , Color orange $ Translate bx by thicCirc
  ] where
  a@(ax, ay) = bezier2d (init l) t
  b@(bx, by) = bezier2d (tail l) t
\end{code}
Propriedades e \emph{main}:
\begin{code}
runBezier :: IO ()
runBezier = play (InWindow "Bézier" (600, 600) (0,  0))
  black 50 initW picture actions tick

runBezierSym :: IO ()
runBezierSym = quickCheckWith (stdArgs {maxSize = 20, maxSuccess = 200} ) prop_bezier_sym
\end{code}

Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}
main = runBezier

run = do { system "ghc cp2021t" ; system "./cp2021t" }
\end{code}

\subsection*{QuickCheck}
Código para geração de testes:
\begin{code}
instance Arbitrary UnOp where
  arbitrary = elements [Negate, E]

instance Arbitrary BinOp where
  arbitrary = elements [Sum, Product]

instance (Arbitrary a) => Arbitrary (ExpAr a) where
  arbitrary = do
    binop <- arbitrary
    unop  <- arbitrary
    exp1  <- arbitrary
    exp2  <- arbitrary
    a     <- arbitrary

    frequency . map (id >< pure) $ [(20, X), (15, N a), (35, Bin binop exp1 exp2), (30, Un unop exp1)]


infixr 5 .=?=.
(.=?=.) :: Real a => a -> a -> Bool
(.=?=.) x y = (toRational x) == (toRational y)


\end{code}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções para os exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado
texto, disgramas e/ou outras funções auxiliares que sejam necessárias.

Valoriza-se a escrita de \emph{pouco} código que corresponda a soluções
simples e elegantes. 

\subsection*{Problema 1} \label{pg:P1}
São dadas:
\begin{code}
cataExpAr g = g . recExpAr (cataExpAr g) . outExpAr
anaExpAr g = inExpAr . recExpAr (anaExpAr g) . g
hyloExpAr h g = cataExpAr h . anaExpAr g

eval_exp :: Floating a => a -> (ExpAr a) -> a
eval_exp a = cataExpAr (g_eval_exp a)

optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
optmize_eval a = hyloExpAr (gopt a) clean

sd :: Floating a => ExpAr a -> ExpAr a
sd = p2 . cataExpAr sd_gen

ad :: Floating a => a -> ExpAr a -> a
ad v = p2 . cataExpAr (ad_gen v)
\end{code}

\paragraph{}Tendo como base as funções definidas em cima, conhecendo o comportamento das expressões,
e também a função \emph{inExpAr} e o functor base \emph{baseExpAr},
começamos por definir as funções que faltam para completar o catamorfismo e o anamorfismo essenciais
para transformar este tipo de dados.

\subsubsection*{outExpAr} %-------------------------
\paragraph{}Inicialmente definimos o \emph{outExpAr}, com o auxílio da definição do \emph{inExpAr}, já que
os dois formam um isomorfismo. A partir disto aplicamos algumas leis de forma 
a chegar à função referente ao \emph{outExpAr}.

\begin{eqnarray*}
\start
  outExpAr\ \cdot\ inExpAr\ =\ id
%
\just\equiv{inExpAr}
  outExpAr\ \cdot\ [\underline{X},num\_ops]\ =\ id
%
\just\equiv{Fusão-+\ (20)}
%
  [outExpAr\ \cdot\ \underline{X},\ outExpAr\ \cdot\ num\_ops]\ =\ id
%
\just\equiv{Universal-+\ (17) e Natural-id\ (1)\ (aplicada duas vezes)}
%
  |lcbr(
    outExpAr . const X = i1 
  )(
    outExpAr . num_ops = i2 
  )|
%
\just\equiv{Substituição de num\_ops, Igualdade extensional (71) e Def-comp (72)}
%
\begin{lcbr}
  |outExpAr X = i1 ()| \\
  |outExpAr (N a) = i2 (i1 a)| \\
  |outExpAr (Bin op a b)  = i2 (i2 (i1 (op,(a,b))))| \\
  |outExpAr (Un op a) = i2 (i2 (i2 (op,a)))| \\
\end{lcbr}
\end{eqnarray*}

\paragraph{} Além de termos utilizado estas leis em cima para deduzir a definição do \emph{outExpAr}, também nos baseamos no tipo do \emph{out}
enquanto deduzíamos as leis, tornou-se mais intuitivo chegar à definição final, porque através dos tipos soubemos onde injetar cada parte da expressão, e 
basicamente só tivemos de injetar no sítio correto do tipo, cada representação da expressão.

Definição do out:

\begin{code}
outExpAr X = i1 ()
outExpAr (N a) = i2 (i1 a)
outExpAr (Bin op a b) = i2 (i2 (i1 (op,(a,b))))
outExpAr (Un op a) = i2 (i2 (i2 (op,a)))
\end{code}

\subsubsection*{recExpAr}

\paragraph{}A seguir apresenta-se uma restrição ao functor base de |ExpAr|. 
Ao elemento (\textit{N a}) deste data type, vamos aplicar uma função \textbf{g} ao executar o processo recursivo da estrutura.
À variável X constante, e aos operadores, vamos sempre preservar a identidade num processo recursivo,
pois são sempre os mesmos qualquer que seja a transformação a aplicar, e não devem ser afetados.
Às expressões (|ExpAr|) associadas a cada operador, vamos aplicar a mesma função (diferente da função |g| porque aqui estamos a trabalhar com expressões)
 para as transformar, e essa será a função \textbf{f}.
Deste modo obtemos um novo functor base em função de \textbf{g} e \textbf{f}.
O functor |recExpAr|, por sua vez, aplica uma única função às expressões associadas aos operadores binários ou
unários, e por isso, pode assumir a definição do functor base mas preservando os números (\textit{N a}).

\begin{eqnarray*}
\start
  baseExpAr'\ g\ f\ =\ baseExpAr\ id\ g\ id\ f\ f\ id\ f
%
\just\equiv{De acordo com o raciocínio explicado anteriormente}
%
  recExpr\ f = baseExpAr'\ id\ f 
%
\end{eqnarray*}

\paragraph{}Representando graficamente:

\xymatrixcolsep{5pc}\xymatrixrowsep{3pc}
\centerline
{\xymatrix{
    1 + (A + (BinOp \times (ExpAr\ A \times ExpAr\ A) + (UnOp \times ExpAr\ A)))
    \ar[d]_{|id + (id + (id >< (f >< f) + (id >< f)))|} \\
    1 + (A + (BinOp \times (B \times B) + (UnOp \times B)))
  }
}

\paragraph{}Este functor permite-nos transformar a estrutura das expressões recursivamente, e pode ser utilizado em qualquer catamorfismo deste tipo.
Assumimos que a função \textbf{f} recebe o tipo |ExpAr| e tem como saída um tipo abstrato |B|.

\begin{code}
baseExpAr' g f = baseExpAr id g id f f id f

---
recExpAr f = baseExpAr' id f
\end{code}

\subsubsection*{g\_eval\_exp}

\paragraph{}A função |eval_exp|, que calcula o valor de uma expressão, dado um valor para substituir na variável X, é nos dada como um catamorfismo. Com isto,
resta-nos descobrir o seu gene. Começamos por representar o problema num diagrama que representa este catamorfismo, com o intuito de deduzir a definição do gene para obter o resultado pretendido.

\vspace{0.5cm}

\xymatrixcolsep{2pc}\xymatrixrowsep{6pc}
\centerline{\xymatrix{
   ExpAr\ A\ar[d]_-{|cataNat (g_eval_exp)|}
                \ar@@/^2pc/ [rr]^-{|outExpAr|} & \qquad \cong
&   1 + (A + ((BinOp \times (ExpAr\ A \times ExpAr\ A)) + (UnOp \times ExpAr\ A)))  \ar[d]^{|recExpAr(cataNat (g_eval_exp))|}
                \ar@@/^2pc/ [ll]^-{|inExpAr|}
\\
    |A| &  & 1 + (A + ((BinOp \times (A \times A)) + (UnOp \times A)))\ar[ll]^-{|g_eval_exp|}
}}

\vspace{0.5cm}

\paragraph{}Depois de construir o diagrama, conseguimos perceber que o conteúdo do gene seria baseado em \emph{eithers},
porque o tipo de entrada do gene contém várias somas, e o tipo de saída é apenas um \textbf{a}.
Deste modo para transformar todas aquelas somas num único \textbf{a}, recorremos a duas funções auxiliares que nos simplificaram a transformação dos operadores no tipo de saída.
Estas funções basicamente calculam o valor da expressão. 
Nos casos em que o tipo de entrada só contém um \textbf{a} ou então é do tipo 1, são aplicadas as funções id e \underline{a}, respetivamente. (Nota : a pertence ao tipo A).

\begin{code}
unAction (Negate, a) = negate a 
unAction (E, a) = expd a

binAction (Sum, (a,b)) = a + b
binAction (Product, (a,b)) = a * b

g_eval_exp a = either (const a) (either id (either binAction unAction)) 
\end{code}

\subsubsection*{clean e gopt}
\paragraph{}Nesta questão é nos fornecida uma função para otimizar as expressões, e para tal é utilizado um hilomorfismo |hyloExpAr|, que utiliza duas funções chamadas |gopt| e |clean|.
Segundo a definição deste hilomorfismo, podemos representá-lo como uma composição de um catamorfismo, cujo gene é |gopt| com um anamorfismo, cujo gene é |clean|.

\begin{eqnarray*}
\start
optmize\_eval\ a = hyloExpAr\ (\ gopt\ a\ )\ clean
%
\just\equiv{Definição\ de\ hyloExpAr}
%
optmize\_eval\ a = cataExpAr(gopt\ a)\ .\ anaExpAr(clean)
\end{eqnarray*}

\paragraph{}Representando graficamente o hilomorfismo em função do catamorfismo e do anamorfismo, construímos o seguinte diagrama:


\xymatrixcolsep{0.5pc}\xymatrixrowsep{3pc}
\centerline{\xymatrix{
  ExpAr\ A 
    			\ar[d]_-{|anaExpAr (clean)|}
                \ar@@/^2pc/ [rr]^{|clean|} &
&   1 + (A + ((BinOp \times (ExpAr\ A \times ExpAr\ A)) + (UnOp \times ExpAr\ A)))
				\ar[d]^{|recExpAr(anaExpAr(clean))|}\\
	ExpAr\ A
   				\ar[d]_-{|cataNat (gopt)|}
                \ar@@/^2pc/ [rr]^-{|outExpAr|} & \qquad \cong
&   1 + (A + ((BinOp \times (ExpAr\ A \times ExpAr\ A)) + (UnOp \times ExpAr\ A)))  			\ar[d]^{|recExpAr(cataNat (gopt))|}
                \ar@@/^2pc/ [ll]^-{|inExpAr|}
\\
    |A| &  & 1 + (A + ((BinOp \times (A \times A)) + (UnOp \times A)))
    			\ar@@/^2pc/ [ll]^-{|gopt|}
}}

\paragraph{}Como se pode ver no diagrama, a função clean não altera os tipos da estrutura, porque apenas simplifica as expressões.
Foi por esta razão que nos baseamos no |outExpAr|, e sabíamos que era preciso injetar valores em sítios diferentes consoante o tipo de entrada.
Essa injeção difere da do |outExpAr| porque é necessário fazer as simplificações às expressões.
Só em casos específicos é que precisamos de implementar essa diferença: quando recebemos um número ou um operador
binário. Os casos que abordamos foram os elementos neutros da adição e multiplicação, e também 
o elemento absorvente da multiplicação. A partir deste raciocínio implementamos a função
|clean| da seguinte forma:

\begin{code}
clean (N a) = i2 (i1 a)
clean (Bin Sum (N 0) a) = clean a
clean (Bin Sum a (N 0)) = clean a
clean (Bin Product (N 1) a) = clean a
clean (Bin Product a (N 1)) = clean a
clean (Bin Product (N 0) a) = clean (N 0)
clean (Bin Product a (N 0)) = clean (N 0)
clean resto = outExpAr resto
\end{code}

\paragraph{}Por outro lado, a função gopt recebe uma expressão e calcula o seu valor, ou seja, transforma uma |ExpAr A| num |A|. No cálculo realizamos manualmente as operações que envolviam elementos neutros e recorremos à função |binAction|, definida anteriormente, para o caso geral.

\begin{code}
gopt a = either (const a) (either id (either binAction' unAction)) where
  binAction' (Sum, (0,b)) = b 
  binAction' (Sum, (a,0)) = a 
  binAction' (Product, (1,b)) = b
  binAction' (Product, (a,1)) = a
  binAction' a = binAction a 

\end{code}

\subsubsection*{sd-gen e ad-gen}
\paragraph{} Finalmente, resta completar as duas funções principais deste problema, |sd| que tem a função de calcular a derivada de uma expressão através de sucessivais transformações (recursividade), e |ad| que, simplesmente procura calcular o valor da derivada de uma expressão no ponto, reduzindo uma expressão a um valor singular.
Dados os catamorfimos destas duas funções, é necessário deduzir os genes respetivos e, ambos, vão produzir um par, sendo que o \emph{sd-gen} tem como resultado (ExpAr A, ExpAr A), onde o primeiro elemento consiste na expressão a derivar e o segundo a derivada desta. Já o \emph{ad-gen} produz um par (A, A), no qual o primeiro elemento é a solução da função no ponto e o segundo é a derivada no mesmo.
Utilizamos funções auxiliares responsáveis por derivar cada parte do tipo, tanto em |sd| como em |ad|. Em baixo seguem-se as definições resultantes:

\vspace{0.5cm}

\begin{code}

sd_gen :: Floating a =>
    Either () (Either a (Either (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) (UnOp, (ExpAr a, ExpAr a)))) ->
     (ExpAr a, ExpAr a)

sd_gen = either derivX (either derivA (either derivBin derivUn)) where
  derivX () = (X, N 1)
  derivA a = (N a, N 0)
  derivBin (Sum, ((a, a'), (b, b'))) = (Bin Sum a b, Bin Sum a' b')
  derivBin (Product, ((a, a'), (b, b'))) = (Bin Product a b, Bin Sum (Bin Product a b') (Bin Product a' b))
  derivUn (Negate, (a,a')) = (Un Negate a, Un Negate a')
  derivUn (E, (a,a')) = (Un E a, Bin Product (Un E a) a')


\end{code}

\begin{code}
ad_gen v = either (auxX v) (either auxN (either auxBin auxUn)) where
  auxX v ()  = (v,1)
  auxN a = (a,0)
  auxBin (Sum,((a,b),(c,d))) = ((+) a c,(+) b d)
  auxBin (Product,((a,b),(c,d))) = ((*) a c, (+) ((*) a d) ((*) b c))
  auxUn (Negate,(a,b)) = (-a, -b)
  auxUn (E,(a,b)) = (expd a, (*) (expd a) b)
\end{code}

\subsection*{Problema 2}
\paragraph{}Para resolver esta questão, e baseando-nos no exemplo dado no enunciado, temos de começar por encontrar funções mutuamente recursivas, tal como na função exponencial.
Para tal desdobramos a equação, até encontrarmos três destas funções, tal como se segue:

\begin{eqnarray}
  C_n = \frac{(2n)!}{(n+1)! (n!) }
  \label{eq:cat}
\end{eqnarray}

\begin{spec}
c 0 = 1
c (n+1) = frac ((2(n+1))!) (((n+1)+1)! (n+1)!) = frac ((2n+2)!) ((n+2)! (n+1)!) =

= frac ((2n+2)(2n+1)(2n)!) ((n+2)(n+1)(n)! (n+1)!) = frac (2(n+1)(2n+1)(2n)!) ((n+2)(n+1)(n)! (n+1)!) =

= frac (2(2n+1)(2n)!) ((n+2)(n)! (n+1)!) = frac ((2n)!) ((n+1)!(n)!) . frac (4n+2) (n+2) = c n . frac (d n) (e n)
\end{spec}

\paragraph{}Já tendo a função principal dividida em três que se complementam, resta-nos definir os casos base de cada uma delas, e também o caso do fator (n + 1) para aplicar a recursividade em cada uma delas.

\begin{spec}
d 0 = 2
d n = 4n + 2
d (n + 1) = (4(n + 1) + 2) = 4n + 6 = d n + 4

e 0 = 2
e n = n + 2
e (n + 1) = n + 1 + 2 = e n + 1
\end{spec}

\paragraph{}Por fim, resta-nos passar tudo para código, e já conseguimos completar o |loop|, que consiste em utilizar 3 funções mutuamente recursivas como corpo do ciclo, porque é nesta parte que aplicamos a recursividade.
O |init| contém todos os casos de partida, quando n é 0.
O |prj| é o que nos dá aquilo que realmente queremos, que neste caso é a função principal dos números de |Catalan|, e portanto, das três funções devolve-nos o resultado da primeira.

\begin{code}
c 0 = 1
c (n + 1) = div (c n * d n) (e(n + 1))

d 0 = 2
d (n + 1) = 4 + d n

e 0 = 2
e (n + 1) = 1 + e n

cat = prj . (for loop inic) where
  loop (c,d,e) = (div (c * d) e,4 + d,1 + e)
  inic = (1,2,2)
  prj (c,d,e) = c
\end{code}
por forma a que
seja a função pretendida.
\textbf{NB}: usar divisão inteira.
Apresentar de seguida a justificação da solução encontrada.

\subsection*{Problema 3}

\subsubsection*{calcLine}

\paragraph{}Para definirmos a função |calcLine| como um catamorfismo, podemos primeiro representar o diagrama do seu comportamento:

\vspace{0.5cm}

\xymatrixcolsep{2pc}\xymatrixrowsep{6pc}
\centerline{\xymatrix{
   |NPoint|\ar[d]_-{|calcLine|}
                \ar@@/^2pc/ [rr]^-{|outList|} & \qquad \cong
&   1 + (|Rational| \times |NPoint|)  \ar[d]^{|recList (cataNat (h))|}
                \ar@@/^2pc/ [ll]^-{|inList|} & \qquad \cong
\\
    (|OverTime NPoint|)^|NPoint| &  & 1 + (|Rational| \times ((|OverTime NPoint|)^|NPoint|))\ar[ll]^-{|h|}
}}

\vspace{0.5cm}

\paragraph{}Com este diagrama e com a função já definida no anexo C, compreende-se que, para passar aquela definição para um catamorfismo, temos de construir o gene que nos permita passar do tipo
1 + Q x |(OverTime NPoint)^NPoint| para |(OverTime NPoint)^NPoint|.
\paragraph{}Como no lado esquerdo recebemos um tipo com um único habitante, que é a lista vazia, retornamos |nil|.
No lado direito, por sua vez, recebemos um par, com o racional que estava à cabeça da lista original, e com a aplicação do catamorfismo já feita para a cauda.
Assim, tomando como base a definição já dada, podemos definir o |h2| (lado direito) com a definição idêntica à dada.

\begin{code}

calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine = cataList h where
   h = either h1 h2
   h1 _ _ = nil
   h2 (d,f) l = case l of
      [] -> nil
      (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z

\end{code}

\subsubsection*{deCasteljau}

\paragraph{}Nesta questão pensamos em transformar o hilomorfismo num catamorfismo seguido de um anamorfismo, no entanto não conseguimos deduzir as definições necessárias para resolver este problema nem efetivamente construir o diagrama, porque não percebemos muito bem o comportamento da função |deCasteljau|.

\begin{code}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau = hyloAlgForm alg coalg where
   coalg = undefined
   alg = undefined

hyloAlgForm = undefined
\end{code}

\subsection*{Problema 4}

\paragraph{}


\begin{code}
avg = p1.avg_aux
\end{code}

\subsubsection*{Listas não vazias}

\paragraph{}De forma a poder trabalhar sobre listas não vazias (que são utilizadas nesta questão) tivemos que definir uma função |outList'| e um catamorfismo |cataList'| específicos, para usarmos na construção da solução deste problema.
O |out| será o destrutor deste tipo, e deste modo podemos injetar à esquerda um único elemento ou então à direita a cabeça da lista, concatenada com a sua cauda.

\begin{code}

outList' [h] = i1 h
outList' (h:t) = i2 (h,t)

cataList' g = g . recList(cataList' g) . outList'

\end{code}

\subsubsection*{avg\_aux}

\paragraph{}Para descobrir a definição desta função, já temos o novo catamorfismo definido e só falta descobrir o gene a aplicar para obter o resultado pretendido.
Sabemos do enunciado que a função |avg| está em recursividade mútua com |length|, ou seja, estamos a reduzir a informação da estrutura para obter a média, e ao mesmo tempo, o tamanho da lista.
Também nos é dito que o gene é um \emph{either}, e por isso, só nos resta definir as funções que o constituem.
Primeiro é necessário definir um diagrama para auxiliar o raciocínio:

\vspace{0.5cm}

\centerline{
\xymatrixcolsep{2pc}\xymatrixrowsep{3pc}
{\xymatrix{
    A^{+}
          \ar[d]_-{|cataNat(either b q)|}
                \ar[rr]^-{|outList'|} &
&   A + (A \times A^{+})
        \ar[d]^{|recList(cataNat (either b q))|}\\
    A \times N_0 &  & A + A \times (A \times N_0)
          \ar[ll]^-{[b,q]}
}}
}

\vspace{0.5cm}

\paragraph{}Partindo deste catamorfismo, surge com mais facilidade o comportamento da função |avg_aux|.
Para descobrir o seu gene, assumimos que já temos a média e o tamanho da cauda da lista, e só precisamos de aplicar a transformação final ao elemento que está à cabeça.
Tanto o componente |b| como o |q| do \emph{either} serão um split, visto que a partir do tipo do habitante da lista, que neste caso é um |A|, vamos gerar um par.
O |b| é aplicado ao elemento singular da lista, e por isso colocamos à esquerda do par o próprio valor, e à direita o número 1.
O |q| é mais complexo porque temos de lidar com o elemento que está à cabeça da lista e o par que já vem calculado previamente.
Como à esquerda fica a média, utilizamos à esquerda a função |avgCalc| para a calcular, e à direita a função |succAux|, que simplesmenta adiciona um ao valor que vem calculado anteriormente.
Com isto, definimos as funções desta forma:

\begin{code}

succAux = succ . p2 . p2
avgCalc (a,(avg,len)) = (a + (avg * len)) / (len + 1) 

avg_aux = cataList' (either b q) where
  b = split id (const 1)
  q = split avgCalc succAux

\end{code} 

\subsubsection*{avgLTree}

Solução para árvores de tipo \LTree:
\paragraph{}Nesta questão, começamos novamente pela elaboração do diagrama, e como já tinhamos percebido bem o problema com a questão anterior, bastou agora adaptar ao novo tipo de dados |LTree|.


\vspace{0.5cm}

\centerline{
\xymatrixcolsep{2pc}\xymatrixrowsep{3pc}
{\xymatrix{
    LTree\ A
          \ar[d]_-{|cataNat(either b q)|}
                \ar[rr]^-{|outLTree|} &
&   A + (LTree\ A \times LTree\ A)
        \ar[d]^{|recLTree(cataLTree ([b,q]))|}\\
    A \times N_0 &  & A + ((A \times N_0) \times (A \times N_0))
          \ar[ll]^-{[b,q]}
}}
}

\vspace{0.5cm}

\paragraph{}Com isto torna-se simples a aplicação do gene, porque já temos a média e o tamanho das sub-árvores, agora temos de os calcular para a árvore completa.
No caso do elemento singular, podemos projetar a definição anterior para aqui, com o |split id (const 1)|.
Para descobrir o |q|, temos de adaptar os cálculos ao novo tipo de dados, e funciona da seguinte maneira:
para a média multiplicamos a média de cada sub-árvore pelo seu tamanho, depois somamos ambos os resultados e dividimos pelo tamanho conjunto das sub-árvores, ou seja, a soma do comprimento de cada uma; para o comprimento, basta somar os valores das duas sub-árvores e obtemos o comprimento total.

\paragraph{}Como tanto nesta questão como na anterior só nos interessa conhecer a média, aplicamos |p1| depois de executar o catamorfismo, em ambos os casos, para nos devolver o elemento que se encontra à esquerda no par (a média).

\begin{code}
avgLTree = p1.cataLTree g where
   g = either (split id (const 1)) (split auxAvgLTree auxLenLTree)
   auxAvgLTree ((a1,l1),(a2,l2)) = (((a1*l1) + (a2*l2)) / (l1+l2))
   auxLenLTree ((_,l1),(_,l2)) = l1 + l2
\end{code}

\subsection*{Problema 5}
Inserir em baixo o código \Fsharp\ desenvolvido, entre \verb!\begin{verbatim}! e \verb!\end{verbatim}!:

\begin{verbatim}
module BTree

open Cp
open List 
open Seq

// (1) Datatype definition -----------------------------------------------------

type BTree<'a> = Empty | Node of 'a * (BTree<'a> * BTree<'a>)

let inBTree x = either (konst Empty) Node x

let outBTree x =
    match x with
    | Empty -> Left ()
    | Node (a,(t1,t2)) -> Right (a,(t1,t2))

// (2) Ana + cata + hylo --------------------------------------------------------

let baseBTree f g = id -|- (f >< (g >< g))
let recBTree g = baseBTree id g
let rec cataBTree g = g << (recBTree (cataBtree g)) << outBTree
let rec anaBTree g = inBTree << (recBTree (anaBTree g)) << g 
let hyloBTree h g = cataBTree h << anaBTree g

// (3) Map ---------------------------------------------------------------------

let fmap f = cataBTree ( inBTree << baseBTree f id)

// (4) Examples
// (4.1) Inversion (mirror)

let invBTree x = cataBTree ( inBTree << (id -|- id >< swap)) x 

// (4.2) Counting

let countBTree x = cataBTree (either (konst 0) (succ << (uncurry (+)) << p2)) x

// (4.3) Serialization

let inord x =
    let join (a,(l,r)) = l @ [a] @ r 
    in either nil join x 

let inordt x = cataBTree inord x 

let preord x =
    let f (a,(l,r)) = a :: (l @ r) 
    in either nil f x 

let preordt x = cataBTree preord x 

let postordt x = 
    let f (a,(l,r)) = l @ r @ [a] 
    in cataBTree (either nil f) x

// (4.4) Quicksort

let rec part x y = 
    match x y with
    | p [] -> ([],[])
    | p (h::t) -> if p h then let (s,l) = part p t in (h::s,l) else let (s,l) = part p t in (s,h::l)

let qsep x =
    match x with 
    | [] -> Left ()
    | (h::t) ->
        let (s,l) = part (<h) t
        in Right (h,(s,l))

let qSort x = hyloBTree inord qsep x 

// (4.5) Traces

let union left right =
    List.append left right |> Seq.distinct |> List.ofSeq

let tunion (a,(l,r)) = union (List.map (a::) l) (List.map (a::) r)

let traces x = cataBTree (either (konst [[]]) tunion) x

// (4.6)

let present x = inord x 

let strategy (d,x) =
    match (d,x) with
    | (d,0) = Left ()
    | (d,x+1) = Right ((x,d),((not d,x),(not d,x)))

let hanoi x = hyloBTree present strategy x

// (5) Depth and balancing (using mutual recursion)

let baldepth x =
    let g = either (konst(True,1)) (h << (id><f))
    h(a,((b1,b2),(d1,d2))) = (b1 && b2 && abs(d1-d2)<=1,1+max d1 d2)
    f((b1,d1),(b2,d2)) = ((b1,b2),(d1,d2))
    in cataBTree g x 

let balBTree x = p1 << baldepth x

let depthBTree x = p2 << baldepth x 

// (6) Going polytipic

let tnat f x =
    let theta = uncurry mappend
    in either (konst mempty) (theta << (f >< theta)) x 

let monBTree f x = cataBTree (tnat f) x 

let preordt' x = monBTree singl x

let countBTree' x = monBTree (konst (Sum 1)) x 

// (7) Zipper

type Deriv<'a> = Dr bool of 'a (BTree of 'a) 
type Zipper<'a> = List<Deriv<'a>> 

let rec plug x y =
    match x y with
    | [] t = t 
    | ((Dr false a l)::z) t = Node (a,(plug z t,l))
    | ((Dr true a r)::z) t = Node (a,(r,plug z t))

\end{verbatim}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp2021t}

%----------------- Fim do documento -------------------------------------------%
\end{document}