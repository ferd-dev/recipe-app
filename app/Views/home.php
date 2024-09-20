<?php include __DIR__ . '/layout/header.php'; ?>
<?php include __DIR__ . '/layout/navbar.php'; ?>

<div class="page-header d-print-none">
    <div class="container-xl">
        <div class="row g-2 align-items-center">
            <div class="col">
                <h2 class="page-title">
                    Recetas
                </h2>
            </div>
            <div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                    <a href="/recipe/index" class="btn btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                            <path d="M12 5l0 14" />
                            <path d="M5 12l14 0" />
                        </svg>
                        Agregar nueva receta
                    </a>
                </div>
            </div>
        </div>

        <?php include __DIR__ . '/layout/carousel.php'; ?>

    </div>
</div>

<div class="page-body">
    <div class="container-xl">
        <div class="row row-cards">
            <div class="col-md-5 col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Categorias</h3>
                    </div>
                    <div class="list-group list-group-flush" id="categories">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <div class="placeholder placeholder-xs col-9"></div>
                                    <div class="placeholder placeholder-xs col-7"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-lg-8">
                <div class="nb-3 text-center d-flex justify-content-center">
                    <div class="col-md-8 col-xl-8">
                        <div class="mb-3">
                            <div class="input-icon">
                                <input id="search" type="text" value="" class="form-control form-control-rounded" placeholder="Search…">
                                <span class="input-icon-addon">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/search -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                        <path d="M21 21l-6 -6" />
                                    </svg>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="recipes">

                </div>
            </div>
        </div>
    </div>
</div>

<?php include __DIR__ . '/layout/footer.php'; ?>
<script type="module" src="../scripts/home.js"></script>

<script>

</script>