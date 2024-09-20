import CardRecipe from './components/CardRecipe.js';
import ListCategory from './components/ListCategory.js';

let currentPage = 1;
let isLoading = false;
let hasMoreRecipes = true;
let category_id = 'todos';

async function getCategories() {
	const categories = document.getElementById('categories');

	const response = await fetch('/getCategories');
	const data = await response.json();

	let html = ListCategory({ name: 'Todos' }, 'active');

	data.forEach((category) => {
		html += ListCategory(category);
	});

	categories.innerHTML = html;
}

async function getRecipes() {
	// if (!hasMoreRecipes) return;
	const recipes = document.getElementById('recipes');

	const response = await fetch(`/getRecipes/${category_id}`);

	const data = await response.json();

	// if (data.length === 0) {
	// 	hasMoreRecipes = false; // Marca que no hay más recetas
	// 	return; // Sale si no hay más recetas
	// }

	let html = ``;
	data.forEach((recipe) => {
		console.log(recipe);
		html += CardRecipe(recipe);
	});

	recipes.innerHTML = html; // Añade las recetas nuevas
	isLoading = false;
}

async function getRecipesScroll(page) {
	if (!hasMoreRecipes) return;
	const recipes = document.getElementById('recipes');

	const response = await fetch(`/getRecipes/${category_id}?page=${page}`);

	const data = await response.json();

	if (data.length === 0) {
		hasMoreRecipes = false; // Marca que no hay más recetas
		return; // Sale si no hay más recetas
	}

	let html = ``;
	data.forEach((recipe) => {
		console.log(recipe);
		html += CardRecipe(recipe);
	});

	recipes.innerHTML += html; // Añade las recetas nuevas
	isLoading = false;
}

function handleScroll() {
	if (
		window.innerHeight + window.scrollY >= document.documentElement.scrollHeight &&
		!isLoading
	) {
		isLoading = true;
		currentPage++;
		getRecipesScroll(currentPage);
	}
}

window.addEventListener('scroll', handleScroll);

document.getElementById('categories').addEventListener('click', async (e) => {
	e.preventDefault();
	category_id = e.target.dataset.id;
	currentPage = 1;
	hasMoreRecipes = true;
	const categories = document.getElementById('categories').children;

	for (let i = 0; i < categories.length; i++) {
		categories[i].classList.remove('active');
	}

	e.target.classList.add('active');
	await getRecipes();
});

document.addEventListener('DOMContentLoaded', async function () {
	await getCategories();
	await getRecipes(currentPage);

	const search = document.getElementById('search');
	search.addEventListener('keyup', async (e) => {
		const searchValue = e.target.value;
		const response = await fetch(`/getRecipes/${category_id}?search=${searchValue}`);
		const data = await response.json();

		let html = ``;
		data.forEach((recipe) => {
			html += CardRecipe(recipe);
		});

		document.getElementById('recipes').innerHTML = html;
	});
});
