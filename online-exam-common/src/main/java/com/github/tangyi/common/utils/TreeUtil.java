package com.github.tangyi.common.utils;

import com.github.tangyi.common.persistence.TreeEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 树形工具类
 *
 * @author tangyi
 * @date 2018-09-13-21:01
 */
public class TreeUtil {

    /**
     * 两层循环实现建树
     *
     * @param treeEntities 传入的树实体列表
     * @return List
     */
    public static <T extends TreeEntity> List<T> build(List<T> treeEntities, Object root) {
        List<T> trees = new ArrayList<T>();
        for (T treeEntity : treeEntities) {
            TreeEntity parent = (TreeEntity) treeEntity.getParent();
            if (root.equals(parent.getId()))
                trees.add(treeEntity);
            for (T childEntity : treeEntities) {
                TreeEntity itParent = (TreeEntity) childEntity.getParent();
                if (itParent.getId().equals(treeEntity.getId())) {
                    if (treeEntity.getChildren() == null)
                        treeEntity.setChildren(new ArrayList<TreeEntity>());
                    treeEntity.add(childEntity);
                }
            }
        }
        return trees;
    }
}
