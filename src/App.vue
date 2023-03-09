<template>
      <header>
          <div class="d-flex flex-row justify-content-around">
            <img class="krisztiankepe" src="../src/assets/img/misztergiroszlogo.png" alt="">
            <span class="skibidi"><img class="mt-1 skibidi" src="../src/assets/img/brr-skidibi.gif" alt=""></span>
            <img class="logo" src="../src/assets/img/logo.png" alt="">
            <span class="skibidi"><img class="mt-1 skibidi" src="../src/assets/img/skibidi-dop-dop.gif" alt=""></span>
          </div>
          
      </header>
      <main>
          <kosar ref="kosar"></kosar>
        <etelek ref="etelek" ></etelek>
      </main>
</template>

<style scoped>
@-webkit-keyframes forgasbalra {
            from{
                transform:rotate(1800deg) ;

            }

        }
@-webkit-keyframes forgasjobbra {
            from{
                transform:rotate(-3600deg);
            }

        }
@-webkit-keyframes felle {
            0%{
                transform:scaleY(2) ;
            }
            100%{
                transform: scaleY(6) ;
            }

        }
@-webkit-keyframes jobbrabalra {
            0%{
                transform:scaleX(0.5) ;
            }
            100%{
                transform: scaleX(2) ;
            }

        }
.skibidi1span{
    animation-name: forgasjobbra;
}
.skibidi2span{
    animation-name: forgasbalra;
}
.skibidi2{
    animation-name: jobbrabalra;
    animation-duration: 0.5s !important;
    
}
.skibidi1{
    animation-duration: 0.5s !important;
    animation-name: felle;
}
.skibidi{
    animation-duration: 20s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    z-index: 999;
}
header{
    height: 170px;
    background-color:rgb(1, 124, 194);
}
h1{
    text-align: center;
    color: yellow;
}
aside{
    width: 25%;
  float: right;
}
.krisztiankepe{
    width: 80px;
}
.logo{
    width: 400px;
}
.skibidi{
    width: 400px;
}
img{
    height:160px;
}
*{
    animation-duration: 20s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    z-index: 999;
}
</style>

<script>
import etelek from './views/etelek.vue'
import kosar from './views/kosar.vue'

export default{
    components:{
        etelek,
        kosar
    }
}
</script>
