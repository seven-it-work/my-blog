{% macro render(display_toc) %}
  <div class="toggle sidebar-toggle">
    <span class="toggle-line toggle-line-first"></span>
    <span class="toggle-line toggle-line-middle"></span>
    <span class="toggle-line toggle-line-last"></span>
  </div>

  <aside class="sidebar">
    <div class="sidebar-inner">

      {%- set display_toc = page.toc.enable and display_toc %}
      {%- if display_toc %}
        {%- set toc = toc(page.content, { class: "nav", list_number: page.toc.number, max_depth: page.toc.max_depth }) %}
        {%- set display_toc = toc.length > 1 and display_toc %}
      {%- endif %}

      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-toc">
          {{ __('sidebar.toc') }}
        </li>
        <li class="sidebar-nav-overview">
          {{ __('sidebar.overview') }}
        </li>
      </ul>

      <!--noindex-->
      <div class="post-toc-wrap sidebar-panel">
        {%- if display_toc %}
          <div class="post-toc motion-element">{{ toc }}</div>
        {%- endif %}
      </div>
      <!--/noindex-->

      <div class="site-overview-wrap sidebar-panel">
        {{ partial('_partials/sidebar/site-overview.swig', {}, {cache: theme.cache.enable}) }}

        {{- next_inject('sidebar') }}
      </div>
      <!--   时间组件   -->
      <link type="text/css" rel="stylesheet" href="{{- url_for('/css/timeClock.css')}}"/>
      <div id="timeClockCanvas">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <div id="hour1"></div>
        <div id="hour2"></div>
        <div class="hourPoint1">
          <svg t="1695648337150" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4010" width="36" height="36"><path d="M512 624a112 112 0 1 0 0-224 112 112 0 0 0 0 224z" p-id="4011" fill="#2c2c2c"></path></svg>
        </div>
        <div class="hourPoint2">
          <svg t="1695648337150" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4010" width="36" height="36"><path d="M512 624a112 112 0 1 0 0-224 112 112 0 0 0 0 224z" p-id="4011" fill="#2c2c2c"></path></svg>
        </div>
        <div id="minute1"></div>
        <div id="minute2"></div>
        <div class="minutePoint1">
          <svg t="1695648337150" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4010" width="36" height="36"><path d="M512 624a112 112 0 1 0 0-224 112 112 0 0 0 0 224z" p-id="4011" fill="#2c2c2c"></path></svg>
        </div>
        <div class="minutePoint2">
          <svg t="1695648337150" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4010" width="36" height="36"><path d="M512 624a112 112 0 1 0 0-224 112 112 0 0 0 0 224z" p-id="4011" fill="#2c2c2c"></path></svg>
        </div>
        <div id="second1"></div>
        <div id="second2"></div>
      </div>
      <script src="{{- url_for('/js/timeClock.js') }}"></script>
      <!--   时间组件   -->
      {%- if theme.back2top.enable and theme.back2top.sidebar %}
        <div class="back-to-top motion-element">
          <i class="fa fa-arrow-up"></i>
          <span>0%</span>
        </div>
      {%- endif %}

    </div>
  </aside>
  <div id="sidebar-dimmer"></div>
{% endmacro %}
