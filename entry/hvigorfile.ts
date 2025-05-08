import { hapTasks } from '@ohos/hvigor-ohos-plugin';
import { HvigorPlugin, HvigorNode } from '@ohos/hvigor'

export default {
    system: hapTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[
        customPlugin()  // 应用自定义Plugin
    ]         /* Custom plugin to extend the functionality of Hvigor. */
}

// 实现自定义插件
function customPlugin(): HvigorPlugin {
    return {
        pluginId: 'customPlugin',
        apply(node: HvigorNode) {
            // 插件主体
            console.log('hello customPlugin!');
        }
    }
}