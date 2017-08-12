
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GrfpDocument}[2016/10/13 Template for the GRFP statements]



%% Commands & Related Options:

% Default header is bold and underlined
\newcommand{\grfpheader}{\normalfont\bfseries\uline}

% Default title is bold and underlined
\newcommand{\grfptitle}[1]{\centerline{\normalfont\bfseries#1}}



%% Options for Loaded Packages:

% Allows printing of frame (via geomtry) for debugging/printing out to ensure sizing
\DeclareOption{showframe}{\PassOptionsToPackage{showframe}{geometry}}

\ProcessOptions\relax

%% Required Packages:

% Based on standard article
\LoadClass[12pt]{article}

% Using geometry for margins etc.
\RequirePackage[letterpaper, left=1in, right=1in, top=1in, bottom=1in, total={6.5in, 9.5in}, footskip=0in, marginparwidth=0in, headheight=0in, bindingoffset=0in]{geometry}

\RequirePackage{paralist}
\RequirePackage{ulem}
\RequirePackage{times}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{notoccite}
\RequirePackage[superscript,biblabel,nomove]{cite}

%% Document Settings and Other Commands:

\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}

\pagenumbering{}
\linespread{1.0}
% Section formatting
\renewcommand{\section}{
    \@startsection{section}{1}{\z@}{\z@}{-5pt}{\grfpheader}
}

% References formatting
\renewenvironment{thebibliography}[1]{%
  \fontsize{10pt}{12pt}\selectfont
  \let\par\relax\let\newblock\relax
  \inparaenum
  \let\olditem\item
  \renewcommand{\item}[1][]{\textbf\olditem}
}{\endinparaenum}

\renewcommand{\title}[1]{\grfptitle{#1}}

% More formatting
\AtBeginDocument{
    \nocite{*}
    \bibliographystyle{unsrt}
}
