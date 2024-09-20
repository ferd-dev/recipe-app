export default function ListCategory(category, active = false) {
	return `<a href="" 
                class="list-group-item list-group-item-action ${active ?? ''} py-3" 
                data-id="${category.id ?? 'todos'}"
            >
                ${category.name ?? 'Todos'}
            </a>`;
}
