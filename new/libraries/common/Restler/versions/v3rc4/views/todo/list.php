<?php return <<<TEMPLATE
        <li id="todo-{$id}" class="todo">
            <div class="text">{$text}</div>

            <div class="actions">
                <a href="#" class="edit">Edit</a>
                <a href="#" class="delete">Delete</a>
            </div>

        </li>

TEMPLATE;
