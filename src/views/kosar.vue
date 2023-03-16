<template>

<button class="btn btn-lg btn-dark m-3 rounded-circle kosargomb" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-cart3"></i></button>
  <button class="btn btn-lg btn-dark m-3 felvetel " data-bs-toggle="modal" data-bs-target="#ujgyrosz"> <i class="bi bi-plus"></i></button>


  <div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title" id="offcanvasScrollingLabel"> Kosaram tartalma </h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div v-for="kosaritem in kosartartalom" class="align-center row m-0 ElemAKosarban">
        <table>
          <tr>
            <td class="p-1" colspan="2">{{ kosaritem.nev }}</td>
            <td rowspan="2" class="text-end"><button @click="KosarItemTorles(kosaritem)" class="btn btn-danger m-3"><i class="bi bi-trash"></i></button></td>
          </tr>
          <tr>
            <td>{{ kosaritem.mennyiseg }} db</td>
            <td>{{ kosaritem.mennyiseg*kosaritem.ar }} Ft</td>
          </tr>
        </table>
        
      </div>
      <input type="text" class="form-control mt-3" v-model="rendeles.nev" placeholder="Név">
      <input type="text" class="form-control mt-3" v-model="rendeles.cim" placeholder="Szállítási cím">
      <div class="input-group mt-3">
        <span class="input-group-text">+36 </span>
        <input type="text" class="form-control" v-model="rendeles.telefonszam" placeholder="Telefonszám">
      </div>
      <textarea class="form-control mt-3" v-model="rendeles.megjegyzes" placeholder="Megjegyzés"></textarea>



        

      <button class="btn btn-dark m-3" @click="Rendeles()">Rendelés</button>
      <button class="btn btn-success m-3 rendelesek" data-bs-toggle="modal" data-bs-target="#exampleModal">Rendelések</button>
    </div>
  </div>


  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Rendelések</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Név</th>
              <th>Telefonszám</th>
              <th>Cím</th>
              <th>Megjegyzés</th>
              <th>Kiszállítva</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="rendeles in rendelesek">
            <td>{{rendeles.nev}}</td>
            <td>{{rendeles.telefonszam}}</td>
            <td>{{rendeles.cim}}</td>
            <td>{{rendeles.megjegyzes}}</td>
            <td><input type="checkbox" :checked="rendeles.kiszallitva==0 ? false : true"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Bezár</button>
      </div>
  </div>
</div>

  <!-- Modal 2.0 -->
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
<style scoped>

.rendelesek{
  position: absolute;
  bottom: 0;
}
.ElemAKosarban{
  padding: 10px 0 10px 10px;
  border: 1px solid black
}
.kosargomb{
  position: fixed;
  bottom: 0;
  right: 0;
}
.felvetel{
  position: fixed;
  bottom: 0;
  left: 0;
}
.offcanvas{
    background-color:lightgray;
    background-image: url('../assets/img/GörögAkhilleusz.png');
    background-repeat: repeat;
    background-size: contain;
    padding: 0 50px 0 50px;
}
.tipp {
    float: right;
  position: relative;
}
</style>
<script>
import axios from 'axios';

export default{
   components: {
     axios
   },
   data(){
     return{
       kosartartalom:[],
       rendeles:{},
       rendelesek:[],
       ujetel:{},
       baseurl:"http://localhost/Gyros/API/database.php"
      }
    },
created(){
  this.Kosar();
  this.RendelesekLekeres();

},
methods:{
  RendelesekLekeres(){
    axios.get(this.baseurl+"?table=rendelesek").then(res => {
      this.rendelesek = res.data 
    })
    .catch(err => {
      console.log(err);
    });
  },
  Kosar(){
      if (JSON.parse(localStorage.getItem("kosar"))==null) {
      this.kosartartalom=[]
      }
      else{
        this.kosartartalom=JSON.parse(localStorage.getItem("kosar"));
      }
    },
  KosarItemTorles(kosaritem){
    this.kosartartalom.splice(this.kosartartalom.findIndex(x => x.ID ==kosaritem.ID), 1)
    localStorage.setItem("kosar", JSON.stringify(this.kosartartalom))
    this.Kosar()
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
      
    })
    }
  },
  Rendeles(){
    if (this.rendeles.nev == null || this.rendeles.cim == null || this.rendeles.telefonszam == null) {
      alert("nem adott meg minden adatot!")
    }else{
      let data={
        table:"rendelesek",
        values: {
          nev: this.rendeles.nev, 
          telefonszam: this.rendeles.telefonszam, 
          cim: this.rendeles.cim, 
          megjegyzes:this.rendeles.megjegyzes 
        }
      }
      axios.post(this.baseurl, data).then(res => {
        for (let i = 0; i < this.kosartartalom.length; i++) {
          console.log(this.kosartartalom);
          let kapcsolatdata={
            table:"kapcsolat",
            values:{
              rendelesekID:res.data.insertId,  
              etelekID:this.kosartartalom[i].ID,
              mennyiseg:this.kosartartalom[i].mennyiseg
            }
          }
          console.log(kapcsolatdata);
          axios.post(this.baseurl, kapcsolatdata).then(res =>{
            if (i==this.kosartartalom.length-1) {
              alert("rendelését sikeresen rögzítettük!")
        
              localStorage.setItem("kosar", JSON.stringify([]))
              this.rendeles={}
              this.Kosar()  
              this.RendelesekLekeres()    
            }
          })

        }
      })
    }
  }
}
}


</script>