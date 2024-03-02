import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        this.sortable = Sortable.create(this.element, {
            animation: 150,
            onEnd: this.end.bind(this)
        })
    }

    end(event) {
        let id = event.item.dataset.id;
        let data = new FormData();
        data.append("position", event.newIndex + 1);

        console.log(`dragged lane ${id} to position ${event.newIndex + 1}`);

        let url = event.item.dataset.url.replace(":id", id);
        Rails.ajax.request({
            url: url,
            type: 'PATCH',
            data: data
        });
    }
}
