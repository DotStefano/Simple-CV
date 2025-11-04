Simple CV — Black & White (Modular)

Minimalist LaTeX CV template — ATS-friendly, print-ready, and modular

Overview

ATS Simple CV es una plantilla de \LaTeX{} limpia y modular para crear un CV profesional, compatible con ATS (seguro para Applicant Tracking System) y fácil de imprimir. Está inspirado en una filosofía de diseño minimalista: tipografía clara, sin colores, sin imágenes, solo contenido estructurado y semántico.

    Diseño en blanco y negro: atemporal, elegante y fácil de imprimir.

    Estructura modular: cada sección se encuentra en su propio archivo .tex.

    Totalmente compatible con Unicode (compilar con LuaLaTeX o XeLaTeX).

    Iconos opcionales de FontAwesome para detalles de contacto.

    Construido para los sistemas de análisis de los reclutadores: 100% basado en texto.

Preview

Puedes ver una vista previa del CV de ejemplo más reciente en: https://raw.githubusercontent.com/DotStefano/ats-simple-cv/main/examples/cv.pdf
Page 1	Page 2
	

Quick Start

    Requiere: TeX Live 2023+ o MiKTeX 2023+.

    Motores recomendados: LuaLaTeX o XeLaTeX.

    Opcional: fontawesome5 para iconos, o microtype para un mejor espaciado.

Compile from terminal

Bash

lualatex main.tex
# or
xelatex main.tex

VS Code + LaTeX Workshop

    Abre tu carpeta en VS Code.

    Presiona Ctrl + Alt + B (Windows/Linux) o Cmd + Option + B (macOS).

    Selecciona XeLaTeX o LuaLaTeX.

Project Structure

Plaintext

.
├── main.tex             # Main file — compile this one
├── sections/
│   ├── summary.tex
│   ├── education.tex
│   ├── skills.tex
│   ├── experience.tex
│   ├── extracurricular.tex
│   └── (optional) honors.tex, publications.tex, etc.
├── examples/
│   ├── cv.pdf
│   └── screenshots/
└── README.tex

Personal Information

Edita los siguientes campos en la parte superior de main.tex:
Code snippet

\newcommand{\cvName}{Daniel}
\newcommand{\cvSurname}{E. Harris}
\newcommand{\cvRole}{Finance Manager}
\newcommand{\cvLocation}{New York, NY}
\newcommand{\cvPhone}{(+1) 516-436-0384}
\newcommand{\cvEmail}{DanielEHarris@jourrapide.com}
\newcommand{\cvWebsite}{https://bellautoonline.com}
\newcommand{\cvGithub}{MySite}
\newcommand{\cvLinkedin}{MySite}

Adding a New Section

Cada sección es un archivo .tex independiente ubicado dentro del directorio sections/.

Step 1 — Create the File

Bash

sections/projects.tex

Step 2 — Add Content

Code snippet

\CVSection{Projects}

\CVItem{Financial Forecasting Dashboard}
  {Developed a real-time KPI tool integrating Excel, SQL, and Power BI.}
  {EagleCorp Holdings}
  {2024}

\CVItem{M&A Valuation Model}
  {Built a sensitivity-based valuation model for acquisition targets.}
  {Harrison & Co. Consulting}
  {2022}

Step 3 — Import into main.tex

Code snippet

\input{sections/projects.tex}

Luego, vuelve a compilar tu CV.

Macros Reference

Macro	Description
\CVSection{Title}	Título de la sección con una regla horizontal. Ejemplo: \CVSection{Education}
\CVItem{title}{institution}{location}{dates}	Entrada de una sola línea. Ejemplo: \CVItem{BSc in Economics}{NYU}{New York}{2017--2020}
\CVRole{role}{company}{location}{dates}{\item ...}	Experiencia laboral con lista de viñetas. Ejemplo: \CVRole{Finance Manager}{EagleCorp}{NY}{2022--Present}{\item ...}
\begin{CVList}...\end{CVList}	Lista de viñetas compacta para habilidades o logros.

Example — Education Section

Code snippet

\CVSection{Education}

\CVItem{Master in Corporate Finance}
  {New York University — Stern School of Business}
  {New York, NY}
  {2018–2020}
\begin{CVList}
  \item Thesis on company valuation models and financial forecasting.
\end{CVList}

\CVItem{Bachelor in Economics and Management}
  {University of California, Berkeley}
  {Berkeley, CA}
  {2013–2017}
\begin{CVList}
  \item Graduated with honors. Activities: Finance and Consulting Club.
\end{CVList}

Header Configuration

Left-Aligned Header (Default)

Code snippet

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
  \vspace{8pt}\\
  \rule{\linewidth}{0.5pt}
  \vspace{10pt}
}

ASCII-Only Header (No Icons)

Code snippet

Location: \cvLocation | Phone: \cvPhone | Email: \href{mailto:\cvEmail}{\cvEmail}
Website: \href{\cvWebsite}{\cvWebsite} | LinkedIn: \href{https://www.linkedin.com/in/\cvLinkedin}{\cvLinkedin}
GitHub: \href{https://github.com/\cvGithub}{\cvGithub}

Example — Skills Section

Plaintext

\CVSection{Skills}

Financial Planning - Budget Control - Profitability Analysis
Cash Flow Management - Forecasting - ERP (SAP, Oracle)
Advanced Excel - Power BI - SQL - Financial Modeling
Team Leadership - Communication - Project Management

Docker Build (Optional)

Si prefieres un entorno en contenedores:
Bash

docker run --rm -it -v "$PWD":/doc -w /doc texlive/texlive:latest \
  sh -lc "lualatex main.tex"

Donate

Ayuda a mantener vivo este proyecto. ¡Las contribuciones son bienvenidas! PayPal: paypal.me/DotStefano

Credits

    LaTeX Project — https://www.latex-project.org

    TeX Gyre Heros — fuente predeterminada

    FontAwesome 5 (opcional) — iconos para información de contacto

    Inspirado en proyectos de CV modulares como Awesome-CV

License

Distribuido bajo la Licencia MIT. Gratis para usar, modificar y redistribuir con atribución.

Maintainer

DotStefano — https://github.com/DotStefano
