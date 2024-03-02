import {Controller} from "@hotwired/stimulus"
import {patch} from '@rails/request.js'
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        this.sortable = Sortable.create(this.element, {
            animation: 150,
            onEnd: this.end.bind(this)
        })
    }

    async end(event) {
        let id = event.item.dataset.id;
        let url = event.item.dataset.url.replace(":id", id);
        const formData = new FormData();
        formData.append('lane[position]', event.newIndex + 1);

        await patch(url, {body: formData} );
    }
}
