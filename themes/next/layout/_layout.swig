<!DOCTYPE html>
<html lang="{{ config.language }}">
<head>

<!-- 常量 -->
<script>
var ROOT_URL="{{ config.root }}"
</script>
  {%- for cssUrl in config.cssLinkList %}
  <link rel="stylesheet" href="{{ cssUrl }}"/>
  {%- endfor %}

  {{- next_js('constant.js') }}
  <!-- 常量 -->
  {{- next_js('my_utils.js') }}
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
<!-- 加载宠物看板 -->
  <script>
    var live2d_path = `{{- url_for('/js/live2d-widge/') }}`;
  </script>
  <script src="{{- url_for('/js/live2d-widge/autoload.js') }}"></script>
  <!-- 加载宠物看板 -->

  <title>{% block title %}{% endblock %}</title>
  {{ partial('_third-party/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
</head>

<body itemscope itemtype="http://schema.org/WebPage">
<div class="container{%- if theme.motion.enable %} use-motion{%- endif %}">
<!-- 还不知道有什么用，一长串黑色的 -->
<!--  <div class="headband"></div>-->
  <header class="header" itemscope itemtype="http://schema.org/WPHeader">
    <!-- 左上角图片 一般节假日什么的 -->
    <!-- <img style="width: auto;position: absolute;top: 0;left: 0;z-index: 9999;" src="{{- url_for('/images/739924dd0dc8e2a37f14d6403cf72acd_134x24.png') }}"/> -->
    <!-- 左上角图片 一般节假日什么的 -->
    <!--   天气组件   -->
    <link type="text/css" rel="stylesheet" href="{{- url_for('/css/wearherWidget.css')}}"/>
    <div id="ww_4b54bde5f3d24" v='1.3' loc='auto'
         a='{"t":"responsive","lang":"zh","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>
      <a href="https://weatherwidget.org/zh/" id="ww_4b54bde5f3d24_u" target="_blank">天气加载中...</a>
    </div>
    <script async src="{{- url_for('/js/wearherWidget.js?id=ww_4b54bde5f3d24') }}"></script>
    <!--   天气组件   -->

    {{ partial('everyDay.swig', {}, {cache: theme.cache.enable}) }}

    <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    <!--   波浪组件   -->
    <link type="text/css" rel="stylesheet" href="{{- url_for('/css/waves.css')}}"/>
    <div>
      <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
           viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
        <defs>
          <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"/>
        </defs>
        <g class="parallax">
          <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7"/>
          <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)"/>
          <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)"/>
          <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff"/>
        </g>
      </svg>
    </div>
    <!--   波浪组件   -->
  </header>
  {{ partial('_partials/widgets.swig', {}, {cache: theme.cache.enable}) }}

  <main class="main">
    <div class="main-inner">
      <div class="content-wrap">
        {% include '_partials/header/sub-menu.swig' %}
        <div class="content {% block class %}{% endblock %}">
          {% block content %}{% endblock %}
        </div>
        {% include '_partials/comments.swig' %}
      </div>
      {%- if theme.sidebar.display !== 'remove' %}
      {% block sidebar %}{% endblock %}
      {%- endif %}
    </div>
  </main>

  <footer class="footer">
  <!--  gitHub贡献 日历组件
    <div id="github_container"></div>
    <script src="{{- url_for('/js/github-calendar/githubcalendar.js') }}"></script>
  gitHub贡献 日历组件 -->

    <div class="footer-inner">
      {% include '_partials/languages.swig' %}
      {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
      {{ partial('_third-party/statistics/index.swig', {}, {cache: theme.cache.enable}) }}
    </div>
    <!--   小人组件   -->
    <div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js"></script>
      <canvas style="width: 100%;height: 500px;" id="canvasPeopleMove"></canvas>
      <script src="{{- url_for('/js/peopleMove.js') }}"></script>
    </div>
    <!--   小人组件   -->
  </footer>
</div>

{{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
{{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

{%- if theme.pjax %}
<div id="pjax">
  {%- endif %}
  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}

  {{- next_inject('bodyEnd') }}
  {%- if theme.pjax %}
</div>
{%- endif %}
</body>
</html>
