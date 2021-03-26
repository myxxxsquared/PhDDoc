
% This work may be distributed and/or modified under the conditions of the
% LaTeX Project Public License, either version 1.3 of this license or (at
% your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version
% 2005/12/01 or later.

% Derived from pkuthss [https://ctan.org/pkg/pkuthss]

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pkusurvey}[2021/03/15]


\def\thss@int@boolopt#1#2{
    \expandafter\newif\csname ifthss@opt@#1\endcsname
    \@nameuse{thss@opt@#1#2}
    \DeclareOption{#1}{\@nameuse{thss@opt@#1true}}
    \DeclareOption{no#1}{\@nameuse{thss@opt@#1false}}
}
\thss@int@boolopt{uppermark}{false}
\thss@int@boolopt{pdftoc}{true}
\thss@int@boolopt{pdfprop}{true}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{amsmath}

\LoadClass[zihao = -4]{ctexbook}[2014/03/06]
\RequirePackage{ifpdf, ifxetex}
\RequirePackage{keyval}
\RequirePackage{graphicx}[1999/02/16]
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[normalem]{ulem}
\AtEndOfClass{\RequirePackage{hyperref}}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage[cmintegrals, varg]{newtxmath}
\RequirePackage{tikz}
\RequirePackage[titles]{tocloft}
\RequirePackage{caption, subcaption}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{bm}
\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[backend=biber,style=caspervector,utf8,sorting=ecnyt,defernumbers=true,citestyle=numeric]{biblatex}

\renewcommand*{\bibfont}{\zihao{5}\linespread{1.27}\selectfont}
\setlength{\bibitemsep}{3bp}

\def\label@ctitle{题目：}
\def\label@cauthor{姓\hphantom{汉字}名：}
\def\label@studentid{学\hphantom{汉字}号：}
\def\label@school{院\hphantom{汉字}系：}
\def\label@cmajor{专\hphantom{汉字}业：}
\def\label@direction{研究方向：}
\def\label@cmentor{导\hphantom{汉字}师：}

\def\titlepagename{封面}
\def\cuniversity{北京大学}
\def\cthesisname{博士学位研究生学科综合考试报告}
\def\cabstractname{摘要}
\def\cabstractnameshow{摘　要}


\linespread{1.67}\selectfont

\setlength{\cftbeforechapskip}{0cm}
\setlength{\cftsecindent}{\ccwd}
\setlength{\cftsubsecindent}{2\ccwd}
\setlength{\cftsubsubsecindent}{4\ccwd}

\DeclareCaptionFont{cfive}{\zihao{5}}
\DeclareCaptionLabelSeparator{quad}{\quad}
\captionsetup{font = cfive, labelsep = quad}

\setlength{\footnotesep}{0pt}

\setlist{nolistsep, leftmargin = 1.5\parindent}

\AtBeginDocument{
    \setlength{\abovedisplayskip}{\belowdisplayshortskip}
    \setlength{\belowdisplayskip}{\abovedisplayskip}

    \let\thss@tmp@tableofcontents\tableofcontents
    \renewcommand{\tableofcontents}{%
        \begingroup
        \thss@int@pdfmark{\contentsname}{contents}
        \thss@tmp@tableofcontents%
        \endgroup
    }
}


\def\thss@int@infoitema#1{
    \@namedef{#1}##1{\@namedef{@#1}{##1}}
    \define@key{thss@info}{#1}{\@nameuse{#1}{##1}}
}

\def\thss@int@infoitemb#1{
    \define@key{thss@info}{#1}{\@namedef{#1}{##1}}
}

\thss@int@infoitema{cauthor}
\thss@int@infoitema{studentid}
\thss@int@infoitema{date}
\thss@int@infoitema{school}
\thss@int@infoitema{cmajor}
\thss@int@infoitema{direction}
\thss@int@infoitema{cmentor}
\thss@int@infoitema{ckeywords}
\thss@int@infoitemb{cuniversity}
\thss@int@infoitemb{cthesisname}
\thss@int@infoitemb{cabstractname}
\thss@int@infoitemb{cabstractnameshow}


\newcommand*{\pkuthssinfo}[1]{\setkeys{thss@info}{#1}}


\geometry{
    a4paper, hmargin = 3.18cm, top = 2.54cm, bottom = 3cm,
    top = 2.54cm, headsep=0.5cm, footskip = 1.05cm
}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{3}

\ctexset {
    chapter = {
        format = {\centering\songti\zihao{2}\bfseries},
        number = {\arabic{chapter}},
        beforeskip = {0cm},
        afterskip = {0.5\ccwd},
        fixskip = {true},
    },
    section = {
        format = {\songti\zihao{3}\bfseries},
        indent = {-3\ccwd},
        fixskip = {true},
        afterindent = {true},
    }
}

\titlespacing{\section}{-3\ccwd}{-0.2cm}{0cm}
\titlespacing{\subsection}{0cm}{0cm}{0cm}

\renewcommand\cftchapfont{\songti\bfseries}

\fancypagestyle{plain}{
    \fancyhf{}\renewcommand*{\headrulewidth}{0.75bp}
    \fancyfoot[C]{\zihao{-5}\normalfont{\thepage}}
    \fancyhead[C]{\zihao{-5}\normalfont{\cuniversity\cthesisname}\vspace*{0.32cm}}
}
\pagestyle{plain}



\def\thss@int@pdfmark#1#2{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \pdfbookmark[0]{#1}{#2}%
}

\def\thss@int@fillinblank#1#2#3{%
    \makebox[0pt][l]{\parbox[t]{#2}{\hspace{0.5cm}{#3}}}\mbox{}%
    \parbox[t]{#2}{%
        \newcount\thss@tmp@linecount
        \thss@tmp@linecount=#1
        \loop\ifnum\thss@tmp@linecount>0
            % Fill specified space with underline on the bottom line. `\underline'
            % draws line on the baseline (not the bottom line), and this is why
            % `\uline' is used here instead.
            \ifnum\thss@tmp@linecount=1
                \uline{\makebox[#2]{}}
            \else
                \uline{\makebox[#2]{}}\\
            \fi
        \advance\thss@tmp@linecount by -1\relax
        \repeat%
    }%
}


\renewcommand{\maketitle}{
    \thss@int@pdfmark{\titlepagename}{titlepage}
    \begingroup\centering
        {
            \vspace*{0.3cm}
            \zihao{1}
            \includegraphics[height = 3.25cm]{pkulogo}\hspace{0.4em}
            \hspace{0.25cm}
            \raisebox{0.4em}{\includegraphics[height = 2.25cm]{pkuword}}\\[0.8em]
            {\bfseries{\cthesisname}}
        }
        
        \vspace{2.6cm}

        {
            \zihao{3}\linespread{2.1}\selectfont
            \def\thss@tmp@len{0.45\textwidth}
            \begin{tabular}{l@{\extracolsep{0.5cm}}l}
                {\bfseries\label@cauthor}        &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@cauthor}        \\
                {\bfseries\label@studentid}    &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@studentid}    \\
                {\bfseries\label@school}        &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@school}        \\
                {\bfseries\label@cmajor}        &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@cmajor}        \\
                {\bfseries\label@direction}    &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@direction}    \\
                {\bfseries\label@cmentor}        &
                \thss@int@fillinblank{1}{\thss@tmp@len}{\kaishu\@cmentor}        \\
            \end{tabular}
        }

        \vspace{5cm}

        {\zihao{4}\heiti\@date}
    \par\endgroup
}




\newenvironment{cabstract}{
\addcontentsline{toc}{chapter}{\cabstractname}
\begin{center}
\zihao{2}\heiti\textbf{\cabstractnameshow}
\end{center} \vspace{0.6cm} \par \linespread{1.67}\zihao{-4}
}{}

\renewcommand\cftdotsep{1}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\endinput

