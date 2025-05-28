import { hapTasks } from '@ohos/hvigor-ohos-plugin';
import { HvigorPlugin, HvigorNode } from '@ohos/hvigor'
import { genIndex, genModelPlugin, jsonToModelPlugin } from '@free/hvigor-arkts-gen-model';

export default {
    system: hapTasks,  /* Built-in plugin of Hvigor. It cann ot be modified. */
    plugins:[
        // jsonToModelPlugin()
    ]         /* Custom plugin to extend the functionality of Hvigor. */
}
