% ==================================================================
% simplecv.cls — Minimal CV class (Black & White, Modular)
% Version 1.0 — Nov 2025
% ==================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplecv}[2025/11/04 v1.0 Minimal ATS CV class]

% Base class
\LoadClass[12pt,a4paper]{article}

% ---------------- Required packages ----------------
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{parskip}
\RequirePackage[unicode]{hyperref}
\RequirePackage{enumitem}
\RequirePackage{xifthen}
\RequirePackage{fontawesome5}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage[automark,headsepline=false,footsepline=false]{scrlayer-scrpage}
\RequirePackage{datetime2}

% ---------------- Page & typography ----------------
\geometry{
  left=2.2cm,
  right=2.2cm,
  top=2cm,
  bottom=2.2cm,
  head=18pt,   % <--- agrega esto
  headsep=12pt % espacio entre header y texto (aunque no haya header visible)
}

\setmainfont{TeX Gyre Heros}
\linespread{1.12}
\setlength{\parindent}{0pt}
\sloppy

\hypersetup{
  colorlinks=false,
  breaklinks=true,
  pdfproducer={Simple CV (simplecv.cls)}
}

% ---------------- Theme colors ----------------
\definecolor{cvgray}{gray}{0.45} % 0=negro, 1=blanco

% ---------------- Public variables (overridable in main) ----------------
\newcommand{\cvName}{}
\newcommand{\cvSurname}{}
\newcommand{\cvRole}{}
\newcommand{\cvLocation}{}
\newcommand{\cvPhone}{}
\newcommand{\cvEmail}{}
\newcommand{\cvWebsite}{}
\newcommand{\cvGithub}{}
\newcommand{\cvLinkedin}{}
\newcommand{\cvDocTitle}{CV}     % texto central en el footer (CV / Résumé / Curriculum)
\newcommand{\cvDate}{\DTMnow}    % fecha en el footer (puedes fijarla en el main)

% ---------------- Header macro ----------------
\newcommand{\makecvheader}{%
  \noindent
  {\LARGE\bfseries \MakeUppercase{\cvName\ \cvSurname}}\\[4pt]
  {\large \cvRole}\\[8pt]
  {\small
    \faMapMarker*~\cvLocation
    \quad|\quad
    \faPhone*~\cvPhone
    \quad|\quad
    \faEnvelope~\href{mailto:\cvEmail}{\cvEmail}}\\[4pt]
  {\small
    \faGlobe~\href{\cvWebsite}{\cvWebsite}
    \quad|\quad
    \faGithub~\href{https://github.com/\cvGithub}{\cvGithub}
    \quad|\quad
    \faLinkedin~\href{https://www.linkedin.com/in/\cvLinkedin}{\cvLinkedin}}
  \vspace{10pt}
}

% ---------------- Footer (scrlayer-scrpage) ----------------
\clearpairofpagestyles
\lofoot{\footnotesize\textcolor{cvgray}{\textsc{\cvDate}}}
\cofoot{\footnotesize\textcolor{cvgray}{\textsc{\cvName~\cvSurname\ •\ \cvDocTitle}}}
\rofoot{\footnotesize\textcolor{cvgray}{\thepage}}
\pagestyle{scrheadings}

% ---------------- Section title with inline rule ----------------
\newcommand{\CVruleheight}{0.6pt}
\newcommand{\CVsectiongap}{0.6em}
\newcommand{\CVSection}[1]{%
  \par\addvspace{14pt}%
  \noindent\leavevmode
  {\large\bfseries #1}%
  \hspace{\CVsectiongap}%
  \leaders\hrule height \CVruleheight\hfill\kern0pt
  \par\addvspace{8pt}%
}

% ---------------- Entry blocks ----------------
% \CVItem{Title}{Org}{Location}{Dates}
\newcommand{\CVItem}[4]{%
  \noindent\textbf{#1}\\
  #2\\
  \ifthenelse{\isempty{#3}}{}{#3\\}%
  \ifthenelse{\isempty{#4}}{}{\emph{#4}}%
  \par\vspace{3pt}%
}

% Role block (Company | Location) + (Role | Dates) + bullets
% \CVRole{Role}{Company}{Location}{Dates}{\item ...}
\newcommand{\CVRole}[5]{%
  \par\addvspace{8pt}%
  \noindent\begin{tabularx}{\linewidth}{@{}X >{\raggedleft\arraybackslash}p{.36\linewidth}@{}}
    \textbf{#2} & \textit{#3} \\
  \end{tabularx}\par
  \noindent\begin{tabularx}{\linewidth}{@{}X >{\raggedleft\arraybackslash}p{.36\linewidth}@{}}
    \textsc{#1} & \textit{#4} \\
  \end{tabularx}\par
  \begin{itemize}[leftmargin=1.2em,itemsep=2pt,topsep=2pt]
    #5
  \end{itemize}
}

% Compact list for details under \CVItem (Education, etc.)
\newenvironment{CVList}{%
  \begin{itemize}[leftmargin=1.2em,itemsep=2pt,topsep=2pt]}{\end{itemize}}

% ---------------- End of class ----------------
\endinput