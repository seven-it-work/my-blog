'use strict';

function parseHtml(args, content) {
  return content;
}

hexo.extend.tag.register('html7', parseHtml, {ends: true});