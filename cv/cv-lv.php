<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV-Manual-<?= date('Ymd') ?></title>
    <link rel="stylesheet" href="css/main.min.css">
</head>

<?php include_once "./functions.php"; ?>

<body>

    <page id="firstPage" class="cv" size="a4" layout="portrait">
        <aside class="sidebar">
            <section class="top">
                <img src="img/profile.jpg" alt="" class="pfp">
                <h1 class="name">Gatis Ieviņš</h1>
                <h3 class="job">Web programmētājs</h3>
            </section>

            <!--
            <section class="identification">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/identification-card-circled.svg") ?>
                </div>
                <h2 class="title">Personas dati</h2>
                <div class="content">
                    <div class="label">Dzimums:</div>
                    <div class="text">Vīrietis</div>
                    <div class="label">Dzimšanas datums:</div>
                    <div class="text">22/11/2001</div>
                    <div class="label">Tautība:</div>
                    <div class="text">Latvietis</div>
                </div>
            </section>
            -->

            <section class="contact">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/address-book-circled.svg" ) ?>
                </div>
                <h2 class="title">Kontakti</h2>
                <div class="content">
                    <div class="label icon">
                        <?= embed_svg_element(
                            "img/icons/envelope-simple.svg" ) ?>
                    </div>
                    <a href="mailto:personal@maskless.id.lv" class="text">personal@maskless.id.lv</a>
                    <div class="label icon">
                        <?= embed_svg_element(
                            "img/icons/phone.svg" ) ?>
                    </div>
                    <div class="text">+371 277 22 983</div>
                    <div class="label icon">
                        <?= embed_svg_element(
                            "img/icons/linkedin-logo.svg" ) ?>
                    </div>
                    <a href="https://www.linkedin.com/in/gatis-ievins/" class="text">linkedin.com/in/gatis-ievins/</a>
                    <div class="label icon">
                        <?= embed_svg_element(
                            "img/icons/github-logo.svg" ) ?>
                    </div>
                    <a href="https://github.com/students-gi/" class="text">github.com/students-gi/</a>
                </div>
            </section>

            <section class="certificates">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/certificate-circled.svg" ) ?>
                </div>
                <h2 class="title">Sertifikāti (īsumā)</h2>
                <div class="content">
                    <div class="node">
                        <div class="label">Google UX Design Specialization by Google
                        </div>
                        <div class="text">
                            <div class="about">
                                <a
                                    href="https://www.coursera.org/account/accomplishments/professional-cert/WWJBUEE3GZJ6"
                                    >Coursera</a>
                            </div>
                        </div>
                    </div>
                    <div class="node">
                        <div class="label">CodinGame Certification - PHP
                        </div>
                        <div class="text">
                            <div class="about">
                                <a
                                    href="https://www.codingame.com/certification/Jvte9mrnHRDF0ZFFD2C3WA"
                                    >CodinGame</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </aside>

        <main class="content">
            <section class="work">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/briefcase-circled.svg" ) ?>
                </div>
                <h2 class="title">Darba pieredze</h2>
                <div class="content">
                    <div class="node dashed">
                        <div class="label">Programmatūras izstrādātājs [Pilna laika]</div>
                        <div class="text">
                            <div class="about">CODELEX -
                                <a href="https://www.codelex.io/en/partners">Mājaslapa</a>
                            </div>
                            <div class="references description">
                                <div class="label">Atsauksmes</div>
                                <label>[Īpašnieks] Sandris Artemjevs:</label> +371 298 948 39<br />
                                <label>[Mentors] Jānis Tumpelis:</label> +371 298 948 39<br />
                            </div>
                            <div class="description">
                                <div class="label">Darba uzdevumi</div>
                                - REST API izstrāde ar CRUD funkcionalitāti<br />
                                - In-memory un SQL datubāzu manipulācijas<br />
                                - Exception/kļūmju pārvaldība<br />
                                - Esošu Unit un Integration testu izmantošana un to jaunu izstrāde
                            </div>
                            <div class="date">2023. maijs - Tagad</div>
                        </div>
                    </div>

                    <div class="node">
                        <div class="label">Front-end programmētājs [Prakse]</div>
                        <div class="text">
                            <div class="about">Files.fm -
                                <a href="https://files.fm/">Mājaslapa</a>
                            </div>
                            <div class="description">
                                <div class="label">Darba uzdevumi</div>
                                - Pielāgot UI vadoties pēc dizaina dokumenta<br />
                                - Realizēt jaunu UI vadoties pēc dizaina dokumenta<br />
                                - AJAX skriptu izstrāde UI aizpildīšanai
                            </div>
                            <div class="date">2022. septembris - 2022. decembris</div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="coding">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/code-circled.svg" ) ?>
                </div>
                <h2 class="title">Programmēšana</h2>
                <div class="content">
                    <div class="text">
                        <div class="description">
                            <div class="label">Valodas</div>
                            HTML, CSS (SCSS, Sass, Bootstrap, W3.CSS, Pure),
                            JavaScript (TypeScript, Twig),
                            PHP (7.4-8.0),
                            SQL,
                            Java (Maven & Gradle, Spring Boot)
                        </div>
                        <div class="description">
                            <div class="label">Datubāzes</div>
                            MySQL, MariaDB, Microsoft SQL, PostgreSQL
                        </div>
                        <div class="description">
                            <div class="label">Web ietvari/frameworks</div>
                            Laravel, Winter CMS, CouchCMS, Wordpress
                        </div>
                        <div class="description">
                            <div class="label">Darba/versiju kontrole</div>
                            git (GitHub), Jira
                        </div>
                    </div>
                </div>
            </section>

            <section class="education">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/graduation-cap-circled.svg" ) ?>
                </div>
                <h2 class="title">Izglītība</h2>
                <div class="content">
                    <!--
                    <div class="node">
                        <div class="label">Vidējā vispārējā izglītība</div>
                        <div class="text">
                            <div class="about">Jelgavas Valsts ģimnāzija -
                                <a href="http://https://vgim.jelgava.lv">Mājaslapa</a>
                            </div>
                            <div class="date">2017. septembris - 2020. jūlijs</div>
                        </div>
                    </div>
                    -->

                    <div class="node dashed">
                        <div class="label">Pirmā līmeņa profesionālā kvalifikācija “Programmētājs”</div>
                        <div class="text">
                            <div class="about">Latvijas Universitāte, datorikas fakultāte -
                                <a href="https://df.lu.lv/">Mājaslapa</a>
                            </div>
                            <div class="date">2020. septembris - Tagad</div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </page>

    <page id="secondPage" class="cv" size="a4" layout="portrait">
        <main class="content">
            <section class="certificates">
                <div class="icon">
                    <?= embed_svg_element(
                        "img/icons/certificate-circled.svg" ) ?>
                </div>
                <h2 class="title">Sertifikāti</h2>
                <div class="content">
                    <div class="node">
                        <div class="label">Google UX Design Specialization by Google
                            <div class="date">27. jūnijs, 2023</div>
                        </div>
                        <div class="text">
                            <div class="about">Issued by Coursera -
                                <a
                                    href="https://www.coursera.org/account/accomplishments/professional-cert/WWJBUEE3GZJ6"
                                    >Sertifikāts</a>
                            </div>
                            <div class="description">
                                Went through the design process 3 times, developing skills in UX/UI design:<br />
                                - Empathizing with users, defining pain points & building personas<br />
                                - Ideating solutions<br />
                                - Creating wireframes and prototypes<br />
                                - Conducting usability testing on designs<br />
                                <separator></separator>
                                Utilized Figma and Adobe XD to create a professional UX portfolio with three projects:<br />
                                - Mobile app design<br />
                                - Responsive website design<br />
                                - Cross-platform experience design<br />
                            </div>
                        </div>
                    </div>
                    <div class="node">
                        <div class="label">CodinGame Certification - PHP
                            <div class="date">24. jūlijs, 2023</div>
                        </div>
                        <div class="text">
                            <div class="about">Issued by CodinGame -
                                <a
                                    href="https://www.codingame.com/certification/Jvte9mrnHRDF0ZFFD2C3WA"
                                    >Sertifikāts</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
    </page>

</body>

</html>