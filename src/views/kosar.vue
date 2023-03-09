<template>

<button class="btn btn-lg btn-dark m-3 rounded-circle kosargomb" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-cart3"></i></button>


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
    </div>
  </div>
</template>
<style scoped>
.ElemAKosarban{
  padding: 10px 0 10px 10px;
  border: 1px solid black
}
.kosargomb{
  position: absolute;
  bottom: 0;
  right: 0;
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
       baseurl:"http://localhost/Fekete párducok/Gyros/API/database.php"
      }
    },
created(){
  this.Kosar();


},
methods:{
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
          let kapcsolatdata={
            table:"kapcsolat",
            values:{
              rendelesekID:res.insertId,  
              etelekID:this.kosartartalom[i].ID,
              mennyiseg:this.kosartartalom[i].mennyiseg
            }
          }
          axios.post(this.baseurl, kapcsolatdata).then(res =>{
            if (i==this.kosartartalom.length-1) {
              alert("rendelését sikeresen rögzítettük!")
        
              localStorage.setItem("kosar", JSON.stringify([]))
              this.rendeles={}
              this.Kosar()      
            }
          })

        }
        


      })
    }
  }
}
}


</script>