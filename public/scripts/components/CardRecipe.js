export default function CardRecipe(recipe) {
	return `<div class="mb-3">
                <a href="#" class="card card-link card-link-pop">
                    <div class="card">
                        <div class="ribbon bg-yellow">
                            Nuevo
                        </div>
                        <div class="row row-0">
                            <div class="col-3">
                                <img src="../img/photos/001.jpg" class="w-100 h-100 object-cover card-img-start" alt="Beautiful blonde woman relaxing with a can of coke on a tree stump by the beach" />
                            </div>
                            <div class="col">
                                <div class="card-body">
                                    <h3 class="card-title">
                                        ${recipe.name}
                                        <small class="h6 mx-2">
                                            ${recipe.created_at}
                                        </small>
                                    </h3>
                                    <p class="text-secondary">
                                        ${recipe.description}
                                    </p>
                                    <div class="row align-items-center">
                                        <div class="col-auto ms-auto">
                                            <span class="badge bg-blue-lt">ver cometarios</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>`;
}
