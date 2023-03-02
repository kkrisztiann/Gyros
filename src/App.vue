<template>
      <header>
          <h1>
              Mr. Gyros
          </h1>
      </header>
      <main>
        <etelek></etelek>
      </main>
      <aside>
          <kosar></kosar>
      </aside>
</template>

<style scoped>

body{
    margin: 0;
}
header{
    height: 200px;
    background-color:rgb(160, 85, 0);
}
h1{
    text-align: center;
    color: yellow;
}
aside{
    float: right;
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
