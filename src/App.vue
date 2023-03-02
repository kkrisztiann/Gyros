<template>
      <header>
          <div class="d-flex flex-row justify-content-around">
            <img src="../src/assets/img/misztergiroszlogo.png" alt="">
          <h1 class="d-flex align-self-center">
              Mr. Gyros
          </h1>
          </div>
          
      </header>
      <main>
          <kosar></kosar>
        <etelek></etelek>
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
img{
    width: 80px;
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
