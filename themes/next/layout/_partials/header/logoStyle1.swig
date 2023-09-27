<style>
.orbit-circle {
  display: inline-block;
  position: relative;
  height: 50px;
  width: 50px;
  transform-origin: center;
  animation: orbit 10s infinite linear;
  animation-delay: 0.25s;
  border: 5px solid white;
  border-radius: 50%;
  box-shadow: 0 0 15px #4bbce7;
}

.orbit-object {
  position: absolute;
  top: 15px;
  left: 0;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #fff;
  box-shadow: 0px 0px 10px #54f7f8, 0px 0px 20px #54f7f8, 0px 0px 30px #54f7f8, 0px 0px 50px #54f7f8, 0px 0px 60px #54f7f8;
  z-index: 1;
}

.orbit-object span.ripple {
  position: relative;
  top: -11px;
  left: 0px;
  width: 5px;
  height: 5px;
  padding: 5px;
  font-size: 0px;
  border-radius: 50%;
  background-color: transparent;
  animation: ripple 1s infinite linear;
}

.text {
  position: relative;
  display: inline-block;
  border-radius: 50%;
  color: white;
  font-size: 80px;
  text-shadow: 0 0 15px #4bbce7;
}

.trace {
  position: relative;
  height: 5px;
  width: 150px;
  top: 50px;
  left: -25px;
  transform-origin: center;
  transform: rotate(-45deg);
  background-color: white;
  z-index: 2;
}

/*responsive*/
@media screen and (max-width: 992px) {
  .text {
    font-size: 58px;
    line-height: 1;
  }

  .orbit-circle {
    position: relative;
    height: 50px;
    width: 50px;
    border: 3px solid white;
  }

  .orbit-object {
    width: 5px;
    height: 5px;
    box-shadow: 0px 0px 5px #54f7f8, 0px 0px 10px #54f7f8, 0px 0px 15px #54f7f8, 0px 0px 25px #54f7f8, 0px 0px 30px #54f7f8;
    top: 7px;
  }

  .orbit-object span.ripple {
    padding: 1px;
    top: -12px;
    left: 2px;
    animation: rippleSmall 1s infinite linear;
  }

  .trace {
    width: 75px;
    height: 3px;
    top: 27px;
    left: -12px;
    z-index: -1;
  }
}

@-webkit-keyframes orbit {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@-moz-keyframes orbit {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@keyframes orbit {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@-webkit-keyframes rippleSmall {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1), 0 0 0 16px rgba(84, 247, 248, 0);
  }
}

@-moz-keyframes rippleSmall {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1), 0 0 0 16px rgba(84, 247, 248, 0);
  }
}

@keyframes rippleSmall {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 4px rgba(84, 247, 248, 0.1), 0 0 0 8px rgba(84, 247, 248, 0.1), 0 0 0 12px rgba(84, 247, 248, 0.1), 0 0 0 16px rgba(84, 247, 248, 0);
  }
}

@-webkit-keyframes ripple {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1), 0 0 0 20px rgba(84, 247, 248, 0);
  }
}

@-moz-keyframes ripple {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1), 0 0 0 20px rgba(84, 247, 248, 0);
  }
}

@keyframes ripple {
  0% {
    box-shadow: 0 0 0 0 rgba(84, 247, 248, 0.1), 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1);
  }
  100% {
    box-shadow: 0 0 0 5px rgba(84, 247, 248, 0.1), 0 0 0 10px rgba(84, 247, 248, 0.1), 0 0 0 15px rgba(84, 247, 248, 0.1), 0 0 0 20px rgba(84, 247, 248, 0);
  }
}

.levitate {
  animation: levitate 1s ease-in-out -0.75s infinite alternate;
}

@keyframes levitate {
  0% {
    transform: translateY(-10px);
  }
  100% {
    transform: translateY(5px);
  }
}

#logo{
  padding: 10px;
}
</style>
<div id="logo">
<div class="orbit-circle">
  <div class="orbit-object"><span class="ripple"></span></div>
</div>
<a href="{{ config.root }}" style="border-bottom: none">
  <div class="text">{{ title }}<b class="">{{ subtitle }}</b></div>
</a>
</div>

