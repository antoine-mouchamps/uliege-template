%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template for creating beautiful academical reports by Antoine Mouchamps (2024) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{template}[A class to create beautiful academical reports by Antoine Mouchamps (2024)]

% ============================
% Custom options of this class
% ============================

\RequirePackage{ifthen} % Gives \ifthen function

\newboolean{isEnglish}
\setboolean{isEnglish}{false}
\DeclareOption{english}{
    \setboolean{isEnglish}{true}
}

\newboolean{isFrench}
\setboolean{isFrench}{false}
\DeclareOption{french}{
    \setboolean{isFrench}{true}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}



% ==========================================
% Packages used and why there are used (WIP)
% ==========================================
%\RequirePackage[utf8]{inputenc} % Specify encoding (KEEP IT)
\RequirePackage[T1]{fontenc} % Important for good font encoding (KEEP IT)
\RequirePackage{amsfonts} % AMS things
\RequirePackage{amssymb} % AMS things
\RequirePackage{amsmath} % AMS things
\RequirePackage{amsthm} % AMS things
\RequirePackage{mathtools}
\RequirePackage{bbold} % A geometric sans serif blackboard bold font, for use in mathematics
\RequirePackage{bm} % \bm makes its argument bold in math mode
\RequirePackage{hyperref} % Customizable hyper-links
\RequirePackage[margin=3cm]{geometry} % Many geometry things
\RequirePackage{colortbl} % Allows rows and cols to be colored
\RequirePackage{diagbox} % Diagonal boxes for table labels
\RequirePackage{longtable} % Allows to make tables that span multiple pages
\RequirePackage[table]{xcolor} % Add many color-related customizations
\RequirePackage{url} % Verbatim with URL-sensitive line breaks
\RequirePackage{float} % Improves the interface for defining floating objects
\RequirePackage{enumitem} % Allows to customise enumerate, itemize and description environments
\RequirePackage{subcaption} % Subcaptions with a) and b) in a figure already labeled
\RequirePackage{graphicx} % Include images in the document
\RequirePackage{multirow} % Flexibilities for tables
\RequirePackage{multicol} % Allows to make itemize automatically spans multiple cols
\RequirePackage{wrapfig} % Allows to make text wrap around figures
\RequirePackage{bigints} % BIGGER NUMBERS
\RequirePackage{sidecap} % Allows to place captions on the left/right of figures
\RequirePackage{comment} % Adds a comment environment
\RequirePackage{cancel} % Allows to cross out expressions (like to simply fractions)
\RequirePackage[justification = centering]{caption} % Allows to center captions
%\RequirePackage[parse-numbers=false]{siunitx} % Easily add units to numbers
\RequirePackage{siunitx} % Easily add units to numbers
\RequirePackage{fancyhdr} % For fancy letterhead and footer
%\RequirePackage{mathptmx} % Adobe Times Roman as text font
\RequirePackage{biblatex} % Package to manage references
\RequirePackage{csquotes} % Required by babel
\RequirePackage{titlesec} % Customize sections and parts display
\RequirePackage{lipsum} % Used to generate Lorem Ipsum paragraphs
\RequirePackage[indent=1.5em, skip=12pt]{parskip} % Default paragraph spacing and indent size
\iflanguage{english}{\RequirePackage[super]{nth}}{} % ordinal numbers in English with \nth{}
% \RequirePackage{ifthen} is already imported from the 'options' section of this class
\RequirePackage{relsize} % Scale integrals and other symbols based on content
%\RequirePackage{todonotes} % Simple and convenient way to make comments and todolists
\RequirePackage{letltxmacro} % Define \LetLtxMacro command
% Change la police des titres pour convenir à votre seul lecteur

% ==========================
% Selection of language used
% ==========================

% If `french` is passed as an option,
% then import the French package.
% ************************************
\ifthenelse{\boolean{isFrench}}{%
    \RequirePackage[french]{babel}
}{}

% If `english` is passed as an option,
% then import the English package.
% ************************************
\ifthenelse{\boolean{isEnglish}}{%
    \RequirePackage[english]{babel}
}{}



% ===============
% Random commands
% ===============

\renewcommand{\arraystretch}{1.5}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\newcommand{\HRulegrossier}{\rule{\linewidth}{1.2mm}}
\geometry{hmargin=2cm,vmargin=2cm} % margins of the content of a page



% ===================
% Letterhead & Footer
% ===================

\pagestyle{fancy}
\setlength{\headheight}{15.5pt}

% Letterhead
\renewcommand{\headrulewidth}{0.1pt}
\fancyhead[C]{} 
\fancyhead[L]{\leftmark}
\fancyhead[R]{\thepage}

% Footer
\renewcommand{\footrulewidth}{0.1pt}
\fancyfoot[C]{} 
\fancyfoot[L]{}

\NewDocumentCommand{\footerRight}{m }{
    \ifthenelse{\equal{#1}{}}
    {
        \iflanguage{french}{\fancyfoot[R]{écriture de bas de page}}{}
        \iflanguage{english}{\fancyfoot[R]{footer text}}{}
    }{
        \fancyfoot[R]{#1}
    }
}


% ============================================
% Environments and commands for the title page
% ============================================

\newenvironment{authors}[1]{%
    \newcommand{\addauthor}[3]{%
        \begin{minipage}{0.9\textwidth/#1}
            \begin{center}\large
                ##1\\\textsc{##2}\\##3\vspace{0.75cm}
            \end{center}
        \end{minipage}
    }
}{}
\newenvironment{titlePage}
    {
    \newcommand{\titlepageimage}[2]{
        \ifthenelse{\equal{##1}{}}{
            \def\image{example-image}
        }{
            \def\image{##1}
        }
        \ifthenelse{\equal{##2}{}}{
            \def\size{0.5}
        }{
            \def\size{##2}
        }
        \begin{figure}[h!]
            \centering
            \includegraphics[width = \size\textwidth]{\image}
        \end{figure}
    }
    
    \newcommand{\academicyear}[1]{
        \ifthenelse{\equal{##1}{}}{
            \def\years{\the\numexpr \number\year-1\relax -\the\year}
        }{
            \def\years{##1}
        }
        \iflanguage{french}{\Large{Année académique \years }\\[1cm]}{}
        \iflanguage{english}{\Large{Academic year \years }\\[1cm]}{}
    }

    \iflanguage{french}{
        \def\defaultTitle{1\iere{} ligne du titre \\ 2\ieme{} ligne du titre}
    }{
        \def\defaultTitle{\nth{1} line of the title \\\nth{2} line of the title}
    }
    
    
    \newcommand{\addtitle}[1]{
        \HRule \\[0.2cm]
        \vspace{1.5mm}
        \ifthenelse{\equal{##1}{}}{
            \textbf{\Large \defaultTitle}
        }{
            \textbf{\Large ##1}
        }
        \\[0.0cm]\HRule
        \vfill
    }

    \begin{titlepage}
        \begin{center}
            \iflanguage{french}{
                \begin{figure}
                    \centering
                    \includegraphics[width=\textwidth]{template_images/Logo_FACSA_FR.pdf}
                \end{figure}
            }{}
            \iflanguage{english}{
                \begin{figure}
                    \centering
                    \includegraphics[width=\textwidth]{template_images/Logo_FACSA_EN.pdf}
                \end{figure}
            }{}
            
            \iflanguage{french}{
                \Large{Université de Liège}\\
                \vspace{1.8mm}
                \Large{Faculté des sciences appliquées}\\
                \vspace{1.8mm}
            }{}
            \iflanguage{english}{
                \Large{University of Liège}\\
                \vspace{1.8mm}
                \Large{Faculty of applied science}\\
                \vspace{1.8mm}
            }{}
            
        }{\end{center}
    \end{titlepage}}



% =======================
% Customize \part command
% =======================

\iflanguage{english}{
    \titleformat{\part}[display]{\normalfont\Large\bfseries\centering}{\partname\;\Roman{part}}{-12pt}{\Huge}
}{
    \titleformat{\part}[display]{\normalfont\Large\bfseries\centering}{\partname}{-12pt}{\Huge}
}
\titlespacing{\part}{0pt}{-12pt}{20pt}

\LetLtxMacro{\oldpart}{\part}
\RenewDocumentCommand{\part}{O{} m}{

    \ifthenelse{\equal{#1}{}}
    {
        \oldpart{#2}\label{ch:#2}
        \addcontentsline{lof}{part}{\thepart\quad#2}%
    }{
        \oldpart[#1]{#2}\label{ch:#2}
        \addcontentsline{lof}{part}{\thepart\quad#1}%
    }
    
    \fancyfoot[L]{\textbf{\ref{ch:#2} #2}} % put the name of the part on the footer
}



% ============================
% Customize \paragraph command
% ============================

\titleformat{\paragraph}[hang]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{0.5em}


% ============================
% Customize figure environment WIP !! I just want to reduce space after a figure without needing to write \vpsace{-0.5cm} everytime
% ============================
% Copy and redefine \itemize
\begin{comment}
\let\tempfigure\figure % Store/copy \figure in \tempfigure
\def\figure{%
  \tempfigure % Original definition of \figure
  \vspace{-0.5cm}
}
\end{comment}

% ===================================================================
% Use roman for page numbering in toc, tof, tot if they are displayed
% ===================================================================

\newcounter{romanNumbering}
\setcounter{romanNumbering}{0}

\LetLtxMacro{\oldtableofcontents}{\tableofcontents}
\RenewDocumentCommand{\tableofcontents}{ }{
        \pagenumbering{roman}
    \setcounter{page}{\theromanNumbering}
    \stepcounter{page}
    \oldtableofcontents
    \setcounter{romanNumbering}{\arabic{page}}
    \newpage
    \pagenumbering{arabic}

}

\LetLtxMacro{\oldlistoffigures}{\listoffigures}
\RenewDocumentCommand{\listoffigures}{ }{
    \pagenumbering{roman}
    \setcounter{page}{\theromanNumbering}
    \stepcounter{page}

    \oldlistoffigures
    \iflanguage{english}{\addcontentsline{toc}{section}{List of Figures}}{}
    \iflanguage{french}{\addcontentsline{toc}{section}{Table des Figures}}{}

    \setcounter{romanNumbering}{\arabic{page}}
    \newpage
    \pagenumbering{arabic}
}

\LetLtxMacro{\oldlistoftables}{\listoftables}
\RenewDocumentCommand{\listoftables}{ }{
    \pagenumbering{roman}
    \setcounter{page}{\theromanNumbering}
    \stepcounter{page}

    \oldlistoftables
    \iflanguage{english}{\addcontentsline{toc}{section}{List of Tables}}{}
    \iflanguage{french}{\addcontentsline{toc}{section}{Liste des tableaux}}{}

    \setcounter{romanNumbering}{\arabic{page}}
    \newpage
    \pagenumbering{arabic}
}


% ===================================================================

% Remove "Package hyperref Warning: Token not allowed in a PDF string (Unicode)" warnings
\pdfstringdefDisableCommands{
    \let\HyPsd@CatcodeWarning\@gobble
}

%\allowdisplaybreaks



%\allsectionsfont{\sffamily\mdseries\upshape}
%\usepackage[nottoc,notlof,notlot]{tocbibind}
%\usepackage[titles,subfigure]{tocloft}
%\renewcommand{\cftsecfont}{\rmfamily\mdseries\upshape}
%\renewcommand{\cftsecpagefont}{\rmfamily\mdseries\upshape}