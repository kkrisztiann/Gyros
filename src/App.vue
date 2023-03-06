<template>
      <header>
          <div class="d-flex flex-row justify-content-around">
            <img class="krisztiankepe" src="../src/assets/img/misztergiroszlogo.png" alt="">
            <img class="mt-1 skibidi" src="../src/assets/img/brr-skidibi.gif" alt="">
            <img class="logo" src="../src/assets/img/logo.png" alt="">
            <img class="mt-1 skibidi" src="../src/assets/img/skibidi-dop-dop.gif" alt="">
          </div>
          
      </header>
      <main>
          <kosar></kosar>
        <etelek ></etelek>
      </main>
</template>

<style scoped>
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
