<template>

<div class="tipp">
    <button class="btn btn-dark" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"> Kosaram </button>
</div>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel"> Kosaram tartalma </h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    
    <div class="d-flex flex-row justify-content-around"> <!-- ezt kell v-for -->
          <div>
            Kaja neve
          </div>
          <div>
           Db
          </div>
          <div>
            Péz
          </div>
      </div>
     <div class="d-flex flex-row justify-content-around">
        <div>
            Őssz ár: 
        </div>
      <div>
          <div>
            <button class="btn btn-dark">
          Rendelés
      </button>
          </div>
      </div>
     </div>

  </div>
</div>

</template>
<style scoped>
.card{
    border: 2px solid black;
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