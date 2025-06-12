import { hapTasks } from '@ohos/hvigor-ohos-plugin';
import { HvigorPlugin, HvigorNode } from '@ohos/hvigor'
import { genModelPlugin } from '@free/generator';

export default {
    system: hapTasks,  /* Built-in plugin of Hvigor. It cann ot be modified. */
    plugins:[
        genModelPlugin()
    ]         /* Custom plugin to extend the functionality of Hvigor. */
}
