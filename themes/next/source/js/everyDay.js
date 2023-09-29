const text_info=document.getElementById("text")
const str="测试一下"
console.log(str)
const str_split=str.split("")
console.log(str_split)
//遍历设置为span，定时span的属性中加入动画，
for(let i =0;i<str_split.length;i++){
  // const t=str_split[i]
  setTimeout(()=>{
    console.log(str_split[i])
    var p = document.createElement("span");
    p.classList.add('a-c');
    p.innerText = str_split[i];
    text_info.appendChild(p);
  },(i)*500)
}
