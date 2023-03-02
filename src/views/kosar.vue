<template>
    <div class="card d-flex flex-column">

        <h2 class="d-flex justify-content-center">
            Kosár
        </h2>

      <div class="d-flex flex-row justify-content-around"> <!-- ezt kell v-for -->
          <div>
            Kaja neve
          </div>
          <div>
            Péz
          </div>
      </div>
      Őssz ár: 
      <button class="btn btn-dark">
          Rendelés
      </button>
    </div>
</template>
<style scoped>
.card{
    border: 2px solid black;
}
</style>