'use strict';



function parseHtml(args, content) {
  let html = `${content}`
  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    const value = arg.split("=");
    if (value && value[0] && value[1]){
      if ( value[0].toLowerCase().trim() === 'js') {
        const jsList = value[1].split(";").filter(e => e);
        for (let j = 0; j < jsList.length; j++) {
          html=html+`<script src="${hexo.config.root}${jsList[j]}"></script>`
        }
      } else if (value[0].toLowerCase().trim() === 'css') {
        const cssList = value[1].split(";").filter(e => e);
        for (let j = 0; j < cssList.length; j++) {
          html=`<link rel="stylesheet" href="${hexo.config.root}${cssList[j]}"/>`+html
        }
      }
    }
  }
  return html;
}

hexo.extend.tag.register('html7', parseHtml, {ends: true});
