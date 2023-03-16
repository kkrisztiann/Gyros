<template>
<div class="d-flex flex-wrap justify-content-around">
  <div v-for="etel in etelek" class="card " style="width: 20rem;">
    <img class="card-img-top kep" :src="etel.kep"  alt="Card image cap">
    <div class="card-body d-flex flex-column justify-content-between">
    <h5 class="card-title d-flex justify-content-center"> {{ etel.nev }} </h5>
    <p class="card-text osszetevok"> {{ etel.osszetevok }} </p>
    <p class="card-text"> {{ etel.ar }}  Ft</p>
    <div class="gombok d-flex justify-content-between">
       <button class="btn btn-danger" @click="Torles(etel.ID)"> <i class="bi bi-trash3"></i> </button>
      <input type="number"  min="1" max="10" v-model="etel.mennyiseg" style="width: 3vw; margin-right: 10px;" name="" id="">
      <a href="#" class="btn btn-dark" @click="KosarbaRak(etel)">Kosárba tesz</a>
    </div>
    </div>
  </div>
</div>

<button class="btn btn-lg btn-dark m-3 felvetel " data-bs-toggle="modal" data-bs-target="#ujgyrosz"> <i class="bi bi-plus"></i></button>

<div class="modal fade" id="ujgyrosz" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> Új Gyros fevétele </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="input-group mb-3">
          <span class="input-group-text"> Név </span>
          <input type="text"  class="form-control" v-model="ujetel.nev">
        </div>
        <div class="input-group mb-3">
          <span class="input-group-text"> Összetevők </span>
          <input type="text" class="form-control" v-model="ujetel.osszetevok">
        </div>
        <div class="input-group mb-3">
          <span class="input-group-text"> Ár </span>
          <input type="number" class="form-control" v-model="ujetel.ar">
        </div>
        <div>
          Kép majd lesz...
        </div>
        <div class="d-flex align-items-center align-self-center">
          <button class="btn btn-dark m-3 " @click="UjGyros()"> Beküldés </button>
        </div>
        <div>

        </div>
      </div>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal"> Bezár </button>
      </div>
  </div>
</div>


</template>

<script>
import axios from 'axios';

export default{
   components: {
     axios
   },
   data(){
      return{
         etelek: [],
         ujetel:{},
         baseurl:"http://localhost/Gyros/API/database.php"
      }
   },
   created(){
    axios.get(this.baseurl+"?table=etelek").then(res => {
      this.etelek = res.data 
      this.etelek.forEach(element => {
        element.kep="../src/assets/img/"+element.kep
        element.mennyiseg=1
      });

    })
    .catch(err => {
      console.log(err);
    });

   },
   methods:{
    KosarbaRak(etel){
      let kosar = this.Kosar();
      let letezo=false;
      for (let i = 0; i < kosar.length; i++) {
        if(kosar[i].ID==etel.ID){
          kosar[i].mennyiseg+=etel.mennyiseg;
          letezo=true;
        }
      }
      if (!letezo) {
        kosar.push(etel);
      }

      localStorage.setItem("kosar", JSON.stringify(kosar))
      this.$parent.$refs.kosar.Kosar();
    },
    Kosar(){
      if (JSON.parse(localStorage.getItem("kosar"))==null) {
      return [];
      }
      else{
        return JSON.parse(localStorage.getItem("kosar"));
      }
    },
    Torles(csajdi){
    let data= {
      table: "etelek",
      id: csajdi
    }
    axios.delete(this.baseurl, {data:data}).then(res => {
      if (res.data.affectedRows == 0) {
        alert("Jelenleg nem törölhető, mivel rendeltek belőle")
      }
    })
    .catch(err =>{
      console.log(err);
    })
  },
  UjGyros(){
    if (this.ujetel.nev == "" || this.ujetel.ar == "" || this.ujetel.osszetevok == null) {
      alert("Minden mezőt kötelező kitölteni!")
    }
    else{
      let data= {
      table: "etelek",
      values: {
        nev: this.ujetel.nev,
        ar: this.ujetel.ar,
        osszetevok: this.ujetel.osszetevok
      }
    }
    axios.post(this.baseurl, data).then(res => {
      data.values.ID = res.insertId;

    })
    }
  },
   }
  }





</script>

<style scoped>
.card{
  border: 2px solid black !important;
  margin: 2%;
}
.kep{
  object-fit:cover;
  height: 200px;
}
.felvetel{
  position: fixed;
  bottom: 0;
  left: 0;
}


</style>