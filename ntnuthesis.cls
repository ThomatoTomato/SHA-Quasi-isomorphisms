%% ntnuthesis.cls - a LaTeX class for theses at NTNU
%%
%% CC-BY CoPCSE@NTNU, 2019
%%
%% Partly merged, partly based on, and partly a simplification of
%% various previous thesis templates by Simon McCallum, Ivar Farup,
%% Kjetil Ørbekk an others, by CoPCSE@NTNU.

%% IDENTIFICATION

\xdef\ntnuthesisdate{2019/07/18}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntnuthesis}
 [\ntnuthesisdate\space
   CC-BY CoPCSE at NTNU 2019]


%% CLASS OPTIONS

% Package for some reason needed before the options
\RequirePackage{pdfpages}                   % including pdf files

% One or twosided paging
\newcommand{\paging}{twoside}
\DeclareOption{oneside}{
  \renewcommand{\paging}{oneside}
}

% Title Page
\DeclareOption{titlepage}{
    \AtBeginDocument{
        \begin{titlepage}
            \maketitle
        \end{titlepage}
    }
}

% British
\newif\ifcapitalize
\DeclareOption{british}{
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology}
    \newcommand{\NTNUTrondheim}{{NTNU} in {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} in {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} in {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsbritish{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% American
\DeclareOption{american}{
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology}
    \newcommand{\NTNUTrondheim}{{NTNU} in {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} in {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} in {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsamerican{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% Bokmål
\DeclareOption{norsk}{
    \capitalizefalse
    \def\papername{Artikkel}
    \newcommand{\NTNU}{{N}orges teknisk-naturvitenskapelige universitet}
    \newcommand{\NTNUTrondheim}{{NTNU} i {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} i {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} i {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Kodeliste}
        \renewcommand{\lstlistlistingname}{Kodelister}
        \crefname{listing}{kodeliste}{kodelister}
        \crefname{equation}{ligning}{ligninger}
        \crefname{appendix}{vedlegg}{vedlegg}
        \crefname{paper}{artikkel}{artikler}
        \addto\captionsnorsk{
            \renewcommand{\appendixname}{Vedlegg}
            \renewcommand{\glossaryname}{Ordliste}
            \renewcommand{\acronymname}{Akronymer}
        }
    }
}

% Nynorsk
\DeclareOption{nynorsk}{
    \capitalizefalse
    \def\papername{Artikkel}
    \newcommand{\NTNU}{{N}oregs teknisk-naturvitskaplege universitet}
    \newcommand{\NTNUTrondheim}{{NTNU} i {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} i {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} i {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Kodeliste}
        \renewcommand{\lstlistlistingname}{Kodelister}
        \crefname{listing}{kodeliste}{kodelister}
        \crefname{equation}{likning}{likningar}
        \crefname{table}{tabell}{tabellar}
        \crefname{figure}{figur}{figurar}
        \crefname{section}{avsnitt}{avsnitt}
        \crefname{chapter}{kapittel}{kapittel}
        \crefname{appendix}{vedlegg}{vedlegg}
        \crefname{paper}{artikkel}{artiklar}
        \renewcommand{\appendixname}{Vedlegg}
        \addto\captionsnynorsk{
            \renewcommand{\appendixname}{Vedlegg}
            \renewcommand{\glossaryname}{Ordliste}
            \renewcommand{\acronymname}{Akronym}
        }
    }
}

\ProcessOptions

%% CLASS FILE LOADING

\LoadClass[a4paper,11pt,openright,\paging]{report}

%% PACKAGE LOADING


% --- Fonts --- %
\RequirePackage{fontspec}                   % Lualatex font encoding
\setmainfont{Atkinson Hyperlegible}         % Set main font to Atkinson Hyperlegible

% --- Layout & Graphics --- %
\RequirePackage{geometry}                   % page layout
\RequirePackage{listings}                   % code listings
\RequirePackage{etoolbox}                   % fixing list of listings spacing
\RequirePackage{enumitem}                   % customising list appearance
\RequirePackage{graphicx}                   % including figures
\RequirePackage{xcolor}                     % selecting text color
\RequirePackage{emptypage}                  % empty pages should be blank
% \RequirePackage{microtype}

% --- Math --- %
\RequirePackage{amsmath}                    % advanced math typesetting
\RequirePackage{amssymb}
\RequirePackage{amsthm}                     % theorem environments
\RequirePackage[                            % subfigures with captions within figures
    font=small,                             % and customisation of captions
    labelfont=bf,
    margin=\parindent
]{caption}
\RequirePackage[                           % and subfigures with captions within figures
    font=small,
    labelfont=bf,
    margin=\parindent
]{subcaption}

% --- Bibliography --- %
\RequirePackage{babel}                      % language specifics
\RequirePackage{csquotes}                   % recommended for biblatex
\RequirePackage[
    backend=biber,
    style=ieee,
    maxbibnames=99,
    minbibnames=3,
    maxcitenames=2,
    mincitenames=1,
    citestyle=numeric-comp,
    sorting=none,
    dashed=false
]{biblatex}                                 % for bibliography
\RequirePackage{booktabs}                   % better formatting of tables
\RequirePackage{hyperref}                   % interactive cross references
\ifcapitalize
    \RequirePackage[capitalize,noabbrev]{cleveref}   % automatic cross references
\else
    \RequirePackage[noabbrev]{cleveref}
\fi
\RequirePackage[acronym]{glossaries}        % create a glossary and acronym list


% --- Tikz & Plots--- %
\RequirePackage{pgfplots}
\RequirePackage{tikz}
\RequirePackage{tikz-cd}

%% CUSTOMISATION

% pgf customs
\pgfplotsset{compat=1.15}

% Tikz customs
\usetikzlibrary{graphs}
\usetikzlibrary{arrows}
\usetikzlibrary{shapes}

% Page geometry and spacing (same for even and odd pages)
\geometry{left=2.5cm, right=2.5cm, top=4cm, bottom=4.5cm}
\frenchspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

% Roman page numbers from the beginning of the document
\pagenumbering{roman}
\setcounter{page}{3}

% Switch to Arabic page numbering at the beginning of the first numbered chapter
\newif\iffirstchapter
\firstchaptertrue
\let\std@chapter\@chapter
\def\@chapter{
    \iffirstchapter
        \pagenumbering{arabic}
        \firstchapterfalse
    \fi
    \std@chapter
}

% Add unnumbered chapters to table of contents and headings
\let\std@schapter\@schapter
\def\@schapter#1{
    \std@schapter{#1}
    \addcontentsline{toc}{chapter}{#1}
    \def\ch@ptermark{#1}
}

% Dotted line and tighter vertical spacing for chapters in the table of contents
\def\l@chapter#1#2{\@dottedtocline{1}{0em}{1.5em}{\bf #1}{\bf #2}}

% Support for included papers (for compiled PhD theses)
\newcounter{paper}
\setcounter{paper}{0}
\def\thepaper{\Roman{paper}}
\newenvironment{paper}[2]
{
    \refstepcounter{paper}
    \def\include@papername{#1}
    \chapter*{\papername~\thepaper}
    \label[paper]{#2}
}{
    \cleardoublepage
    \includepdf[pages=-]{\include@papername}
}

% Allow for two versions of title and authors – full and short
\def\title#1{\def\@title{#1}\def\@shorttitle{#1}}
\def\shorttitle#1{\def\@shorttitle{#1}}
\def\author#1{\def\@author{#1}\def\@shortauthor{#1}}
\def\shortauthor#1{\def\@shortauthor{#1}}

% Headers and footers
\def\ps@ntnuheadings{%
    \let\@evenfoot\@empty
    \let\@oddfoot\@empty
    \def\@evenhead{\small\thepage\hfil\textit{\@shortauthor: \@shorttitle}}
    \def\@oddhead{\small\textit{\ch@ptermark}\hfil\thepage}
    \def\chaptermark##1{\def\ch@ptermark{\chaptername\ \thechapter: ##1}}
}
\pagestyle{ntnuheadings}

% Itemize and enumerate: tighter and with other symbols
\setlist[enumerate]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\alph*., ref=\alph*}
\setlist[enumerate,3]{label=\roman*., ref=\roman*}
\setlist[itemize]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}

% Make \fullcite show all authors irrespectively of maxcitenames
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}

% Colour palette
\definecolor{thesisblue}{rgb}{.15, .15, .6}
\definecolor{thesisred}{rgb}{.4, .05, .15}
\definecolor{thesisgreen}{rgb}{.2, .3, .2}

%Defining theorem environments
% --- Defining theorem env --- % 
\theoremstyle{plain}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lemma}[thm]{Lemma}
\newtheorem{proposition}[thm]{Proposition}
\newtheorem{corollary}{Corollary}[thm]

% --- Defining definition env --- %
\theoremstyle{definition}
\newtheorem{definition}[thm]{Definition}

% --- Defining remark env --- %
\theoremstyle{remark}
\newtheorem{remark}[thm]{Remark}
\newtheorem{construction}[thm]{Construction}
\newtheorem{observation}[thm]{Observation}
\newtheorem{example}[thm]{Example}

% --- Defining proof environment --- %