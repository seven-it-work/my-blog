---
title: 个人介绍
date: 2023-09-23 09:38:38
type: about
---
{% html7 %}
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800');


        .resume h1, h2, h3, h4 {
            -webkit-margin-before: 0px;
            -webkit-margin-after: 0.5em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;

            border-bottom: 3px solid #E32636;
            display: inline-block;
            color: #333333;
            font-weight: 600;
            text-transform: uppercase;
        }

        .resume ul {
            -webkit-margin-before: 0px;
            -webkit-margin-after: 0px;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
            -webkit-padding-start: 0px;

            list-style: none;
        }

        .resume {
            position: relative;
        }

        .resume .row {
            padding-bottom: 15px;
            padding-left: 20px;
        }

        .resume header {
            display: inline-block;
        }

        .resume header h1 {
            font-size: 40pt;
        }


        .resume header ul li {
            height: 25px;
        }

        .resume header ul li i {
            color: #E32636;
            padding-right: 5px;
            padding-left: 5px;
            font-size: 18px;
        }

        .resume article {
            margin-top: 20px;
        }

        .resume article h2 {
            font-size: 20pt;
        }

        .resume article .header {
            color: #E32636;
            font-weight: 600;
        }

        .resume article .header span {
            font-size: 10pt;
            font-style: italic;
        }

        .resume article .right {
            float: right;
            width: 10%;
            font-weight: 600;

        }

        .resume article .description {
            font-style: italic;
            font-size: 9pt;
        }

        .resume article .exp-list .fa {
            color: #E32636;
            padding-right: 5px;
            font-size: 12px;
        }

        .resume article ul li {
            min-height: 25px;
            max-width: 80%;
        }

        .resume article .reference {
            width: 40%;
            display: inline-block;
        }

        .resume article .reference ul li {
            max-width: 100%;
        }

        .resume article .spacer {
            height: 15px;
        }

        .resume article .tech ul li {
            max-width: 100% !important;
        }

        .resume article .tech span {
            font-weight: 600;
            color: #E32636;
        }
    </style>

<div class="resume">
    <header>
        <h1>姓名</h1>

        <div class="row">
            <ul>
                <li class="address"><i class="fa fa-home fa-1x"></i>地址</li>
                <li class="phone">
                    <span><i class="fa fa-phone fa-1x"></i>电话1</span>
                    <span><i class="fa fa-mobile fa-1x"></i>电话2</span>
                </li>
                <li class="email"><i class="fa fa-envelope fa-1x"></i>邮箱</li>
            </ul>
        </div>
    </header>

    <article>
        <h2>技能</h2>

        <div class="row tech">
            <ul>
                <li><span>Languages</span>: Java, PHP, SQL, HTML, CSS, LESS, JSON</li>
                <li><span>Exposure</span>: C, C++, C#, Objective-C, XML, UNIX Shell, JavaScript, Assembly</li>
                <li><span>SDKs</span>: Android, iOS</li>
                <li><span>IDE</span>: Eclipse, Aptana, Visual Studio, PhpStorm, Notepad++, Xcode</li>
                <li><span>Tools</span>: Photoshop, C Shell, GCC, SSH, FTP, MySQL, WAMP, LAMP stack, CodeIgniter, Drupal,
                    Concrete5, Bootstrap
                </li>
                <li><span>Version Control</span>: Git, SVN</li>
                <li><span>Operating Systems</span>: Windows XP, Windows Vista, Windows 7, Windows 8, Ubuntu, Linux</li>
            </ul>
        </div>
    </article>

    <article>
        <h2>教育</h2>
        <div class="row">
            <ul>
                <li class="right">
                    <ul>
                        <li>2020~2016</li>
                    </ul>
                </li>
                <li class="header">xxx大学</li>
<!--                <li>University of SomeCity, SomeCity, United Kingdom</li>-->
<!--                <li class="description">Concentration in Object Oriented Programming, Web Development, and Mathematics-->
                </li>
            </ul>
        </div>
    </article>

    <article>
        <h2>工作经验</h2>
        <div class="row exp-list">
            <ul>
                <li class="right">
                    <ul>
                        <li>2021-09~今天</li>
                    </ul>
                </li>
                <li class="header">xxx公司</li>
                <li><i class="fa fa-caret-right fa-1x"></i>Assisted instructors by providing additional aid to students
                    during their practical sessions
                </li>
                <li><i class="fa fa-caret-right fa-1x"></i>Reviewed materials prior to scheduled practical session to
                    provide accurate answers to questions
                </li>
            </ul>
        </div>
    </article>
<!--    <article>-->
<!--        <h2>References</h2>-->

<!--        <div class="row">References Available Upon Request</div>-->
<!--    </article>-->
</div>
{% endhtml7 %}
