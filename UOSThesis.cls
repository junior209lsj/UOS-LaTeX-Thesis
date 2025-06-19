%% 서울시립대학교 학위논문 LaTeX 양식
% 작성자: 서울시립대학교 기계정보공학과 이성재
% 버전: V1 (2025-06)
% 컴파일러 버전: TeXLive 2024 (pdfLaTeX)
% 주석에 코드에 해당하는 내용을 설명으로 작성했으며, (M)으로 표시된 항목은 서울시립대학교 학위논문 시행세칙에서 지정한 필수 서식임.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UOSThesis}

\newif\ifargko\argkofalse
\DeclareOption{ko}{\argkotrue}
\newif\ifargmaster\argmasterfalse
\DeclareOption{master}{\argmastertrue}

\ProcessOptions\relax

%% 인쇄양식
% 판종: B5 (182mm, 257mm) (M)
% 본문 글씨: 11pt 명조계열 폰트 (M)
% 참고 - 영어 폰트: Times New Roman, 한글 폰트: 나눔명조
\LoadClass[11pt,b5paper,oneside,openany]{book}
\RequirePackage{kotex}
\RequirePackage[paperheight=257mm,
                paperwidth=182mm,
                left=30mm,right=30mm,
                top=30mm,bottom=30mm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{indentfirst}
\RequirePackage{anyfontsize}
\RequirePackage{tgtermes}
\RequirePackage{microtype}

%% 1. 머리말, 꼬리말
% 머리말: 없음
% 꼬리말: 중앙 페이지 번호 (아라비아 숫자) (M)

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plaincenter}{
    \fancyhead{} 
    \fancyfoot[C]{\thepage}
}

\pagestyle{plaincenter}

%% 2. 줄간격
% 들여쓰기: 2글자
% 줄간격: 2.0 (M)

\setlength{\parindent}{2em}
\doublespacing

%% 3. 폰트 크기
% 제목: 22pt (M)
% 부제: 16pt (M)
% 학과명 및 날짜명: 14pt
% 심사위원명: 11pt

\newcommand{\TitleSize}[1]{\fontsize{22pt}{22pt}\selectfont \textbf{#1}}
\newcommand{\SubTitleSize}[1]{\fontsize{16pt}{16pt}\selectfont \textbf{#1}}
\newcommand{\DeptSize}[1]{\fontsize{14pt}{14pt}\selectfont \textbf{#1}}
\newcommand{\NormalSize}[1]{\fontsize{11pt}{12pt}\selectfont #1}

\makeatletter

%% 4. 장절항
% 번호만 사용하는 장, 절, 항 양식 사용
% 장 제목: 16pt, 들여쓰기 0글자 (M)
% 절 제목: 14pt, 들여쓰기 1글자 (M)
% 항 제목: 12pt, 들여쓰기 2글자

\titleformat{\chapter}
  {\normalfont\bfseries\fontsize{16pt}{20pt}\selectfont}
  {\thechapter.}
  {0.5em}
  {}

\titlespacing*{\chapter}{0pt}{0pt}{10pt}

\titleformat{name=\chapter,numberless}
  {\normalfont\bfseries\fontsize{16pt}{20pt}\selectfont}
  {}
  {0pt}
  {}

\titlespacing*{name=\chapter,numberless}{0pt}{0pt}{10pt}

\titleformat{\section}
  {\normalfont\bfseries\fontsize{14pt}{16pt}\selectfont}
  {\thesection}
  {0.5em}
  {}

\titlespacing*{\section}{1em}{10pt}{0pt}

\titleformat{\subsection}
  {\normalfont\bfseries\fontsize{12pt}{15pt}\selectfont}
  {\thesubsection}
  {0.5em}
  {}

\titlespacing*{\subsection}{2em}{10pt}{0pt}

%% 5. 목차
% 목차에 목차, 표목차, 그림목차, 부록, 영문초록 등 포함 (M)
% 제목, 페이지 번호 간 점선 표기 (M)


\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftsecindent}{0pt}
\setlength{\cftsubsecindent}{1.5em}

\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

\newcommand{\maketableofcontents}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\contentsname}
  {\normalfont\bfseries\fontsize{16pt}{16pt}\selectfont\raggedright
   \contentsname\par\nobreak\vskip 0pt}
  \@starttoc{toc}
  \newpage
}

\newcommand{\makelistofigures}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\listfigurename}
  {\normalfont\bfseries\fontsize{16pt}{16pt}\selectfont\raggedright
   \listfigurename\par\nobreak\vskip 0pt}
  \@starttoc{lof}
  \newpage
}

\newcommand{\makelistoftables}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\listtablename}
  {\normalfont\bfseries\fontsize{16pt}{16pt}\selectfont\raggedright
   \listtablename\par\nobreak\vskip 0pt}
  \@starttoc{lot}
  \newpage
}

\makeatother

% 기타 타이틀 이름

\ifargko

\renewcommand{\contentsname}{목차}
\renewcommand{\listfigurename}{그림 목차}
\renewcommand{\listtablename}{표 목차}
\renewcommand{\bibname}{참고문헌}
\newcommand{\bibloname}{참고문헌}
\renewcommand{\indexname}{Index}
\renewcommand{\figurename}{그림}
\renewcommand{\tablename}{표}
\renewcommand{\appendixname}{부록}

\else

\renewcommand{\contentsname}{Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}
\renewcommand{\bibname}{References}
\newcommand{\bibloname}{References}
\renewcommand{\indexname}{Index}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\renewcommand{\appendixname}{Appendix}

\fi

%% 6. 학위논문 작성을 위한 매크로

\AtEndOfClass {

\RequirePackage[
  bookmarks=true,
  bookmarksopen=true,
  bookmarksnumbered=true,
  colorlinks=true,
  linkcolor=black,
  citecolor=blue,
  urlcolor=blue
]{hyperref}

%% 심사위원 서명란 정의

\ifargmaster

\newcommand{\makeenglishreferee}{
\begin{flushright}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Chair: }}\makebox[4cm][c]{\NormalSize{\RefereeFirst}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeSecond}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeThird}} \\
\end{flushright}
}

\newcommand{\makekoreanreferee}{
\begin{flushright}
    \DeptSize{심사위원장} \ \ \underline{\makebox[4cm][c]{\RefereeFirst}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeSecond}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeThird}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
\end{flushright}
}

\else

\newcommand{\makeenglishreferee}{
\begin{flushright}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Chair: }}\makebox[4cm][c]{\NormalSize{\RefereeFirst}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeSecond}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeThird}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeFourth}} \\
    \vspace{5mm}
    \underline{\makebox[9cm][c]{}} \\
    \makebox[7cm][l]{\DeptSize{Thesis Committee Member: }}\makebox[4cm][c]{\NormalSize{\RefereeFifth}} \\
\end{flushright}
}

\newcommand{\makekoreanreferee}{
\begin{flushright}
    \DeptSize{심사위원장} \ \ \underline{\makebox[4cm][c]{\RefereeFirst}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeSecond}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeThird}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeFourth}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
    \DeptSize{심 사 위 원} \ \ \underline{\makebox[4cm][c]{\RefereeFifth}} \ \ \DeptSize{(인)} \par
    \vspace{10mm}
\end{flushright}
}

\fi

%% 겉표지, 제출문, 인준서 정의

\newcommand{\makeenglishfrontcover}{
\thispagestyle{empty}
{\centering
    \SubTitleSize{\EnThesisName} \par
    \vskip 20mm
    \TitleSize{\EnTitle} \par
    \vfill
    \SubTitleSize{by} \par
    \SubTitleSize{\EnAuthor} \par
    \vfill
    \DeptSize{\EnDepartment} \par
    \DeptSize{\EnInstitution} \par
    \vfill
    \SubTitleSize{\EnGraduateDate} \par
}
\newpage
}

\newcommand{\makekoreanfrontcover}{
\thispagestyle{empty}
{\centering
    \SubTitleSize{\KoThesisName} \par
    \vskip 20mm
    \TitleSize{\KoTitle} \par
    \SubTitleSize{\EnTitle} \par
    \vfill
    \SubTitleSize{\KoGraduateDate} \par
    \vfill
    \SubTitleSize{\KoInstitution} \par
    \SubTitleSize{\KoDepartment} \par
    \SubTitleSize{\KoAuthor} \par
}
\newpage
}

\newcommand{\makeenglishproposal}{
\thispagestyle{empty} \noindent
{\centering
    \TitleSize{\EnTitle} \par
    \vfill
    \SubTitleSize{by} \par
    \SubTitleSize{\EnAuthor} \par
    \vfill
    \DeptSize{A~\EnThesisName~submitted to the~\EnDepartment~at~\EnInstitution~in partial fulfillment of the requirements for the degree of~\EnDegree} \par
    \vfill
    \SubTitleSize{\EnSubmissionDate} \par
    \vfill
    \SubTitleSize{Approved by} \par
    \SubTitleSize{\EnAdvisor} \par
    \SubTitleSize{Advisor} \par
}
\newpage
}

\newcommand{\makekoreanproposal}{%
    \thispagestyle{empty} \noindent%
    {\centering
        \TitleSize{\KoTitle} \par %
        \SubTitleSize{\EnTitle} \par %
        \vfill
        \SubTitleSize{지도교수~\KoAdvisor} \par %
        \vfill
        \SubTitleSize{이 논문을 \KoDegree~학위논문으로 제출함} \par %
        \vfill
        \SubTitleSize{\KoSubmissionDate} \par %
        \vfill
        \SubTitleSize{\KoInstitution} \par %
        \SubTitleSize{\KoDepartment} \par %
        \SubTitleSize{\KoAuthor} \par %
    }
    \newpage
}

\newcommand{\makeenglishapproval}{
\thispagestyle{empty} \noindent
{\centering
    \SubTitleSize{This certifies that the~\EnThesisName \\ of \EnAuthor~is approved.} \par
    \vfill
    \makeenglishreferee
    \vfill
    \SubTitleSize{The Graduate School of the University of Seoul} \par
    \SubTitleSize{\EnSubmissionDate} \par
}
\newpage
}

\newcommand{\makekoreanapproval}{%
    \thispagestyle{empty} \noindent
    {\centering
        \null\vskip 0cm % 1cm 추가하기
        \SubTitleSize{\KoAuthor~의 \KoDegree \ 학위논문을 인준함.} \par
        \vfill
        \makekoreanreferee
        \vfill
        \SubTitleSize{\KoSubmissionDate} \par %
        \vskip 1.8cm
        \SubTitleSize{\KoInstitution} \par %
        \null\vskip 0cm
    }
    \newpage
}

\ifargko

\newenvironment{FrontAbstract}{
    \thispagestyle{empty}
    \phantomsection
    \begin{center}
        \SubTitleSize{국문초록}
        \vskip 10mm
    \end{center}
}{
    \vfill
    \medskip
    \noindent \textbf{주요어: }~\KoKeyword \\
    \newpage
}

\newenvironment{BackAbstract}{
    \thispagestyle{empty}
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \begin{center}
        \SubTitleSize{Abstract}
        \vskip 10mm
    \end{center}
}{ 
    \vfill
    \medskip
    \noindent \textbf{Keywords: }~\EnKeyword \\
    \newpage
}

\else

\newenvironment{FrontAbstract}{
    \thispagestyle{empty}
    \phantomsection
    \begin{center}
        \SubTitleSize{Abstract}
        \vskip 10mm
    \end{center}
}{
    \vfill
    \medskip
    \noindent \textbf{Keywords: }~\EnKeyword \\
    \newpage
}

\newenvironment{BackAbstract}{
    \thispagestyle{empty}
    \phantomsection
    \addcontentsline{toc}{chapter}{국문초록}
    \begin{center}
        \SubTitleSize{국문초록}
        \vskip 10mm
    \end{center}
}{ 
    \vfill
    \medskip
    \noindent \textbf{주요어: }~\KoKeyword \\
    \newpage
}

\fi

\newenvironment{KoreanAcknowledgement}{
  \phantomsection 
  \addcontentsline{toc}{chapter}{감사의 글}
  \begin{center}
    \SubTitleSize{감사의 글} \\
    \vskip 10mm
  \end{center}
}{
    \vfill
    \medskip
    \newpage
}

\ifargko
\newcommand{\makefrontcover}{\makekoreanfrontcover}
\newcommand{\makeproposal}{\makekoreanproposal}
\newcommand{\makeapproval}{\makekoreanapproval}
\else
\newcommand{\makefrontcover}{\makeenglishfrontcover}
\newcommand{\makeproposal}{\makeenglishproposal}
\newcommand{\makeapproval}{\makeenglishapproval}
\fi

}
