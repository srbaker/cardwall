import {Controller} from "@hotwired/stimulus"
import {patch} from '@rails/request.js'
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        let sortableParams = {
            animation: 150, onEnd: this.end.bind(this)
        }
        if (this.element.dataset.group) {
            sortableParams = {...sortableParams, group: this.element.dataset.group};
        }

        this.sortable = Sortable.create(this.element, sortableParams)
    }

    async end(event) {
        let id = event.item.dataset.id;
        let url = event.item.dataset.url.replace(":id", id);
        let resource = event.item.dataset.resource;
        const formData = new FormData();
        formData.append(`${resource}[position]`, event.newIndex + 1);
        if (event.to.dataset.groupField) {
            console.log(JSON.stringify(event.to.dataset))
            formData.append(`${resource}[${event.to.dataset.groupField}]`, event.to.dataset.groupId)
        }

        await patch(url, {body: formData});
    }
}
