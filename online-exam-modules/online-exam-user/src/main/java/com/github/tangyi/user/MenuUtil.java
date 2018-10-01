package com.github.tangyi.user;

import com.github.tangyi.common.persistence.TreeEntity;
import com.github.tangyi.user.dto.MenuDto;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tangyi
 * @date 2018-10-01-15:38
 */
public class MenuUtil {

    /**
     * 两层循环实现建树
     *
     * @param menuDtos 传入的树实体列表
     * @return List
     */
    public static List<MenuDto> build(List<MenuDto> menuDtos, Object root) {
        List<MenuDto> menuDtoArrayList = new ArrayList<MenuDto>();
        for (MenuDto menuDto : menuDtos) {
            if (menuDto.getParentId().equals(root))
                menuDtoArrayList.add(menuDto);
            for (MenuDto childMenu : menuDtos) {
                if (childMenu.getParentId().equals(menuDto.getId())) {
                    if (menuDto.getChildren() == null)
                        menuDto.setChildren(new ArrayList<TreeEntity>());
                    menuDto.add(childMenu);
                }
            }
        }
        return menuDtoArrayList;
    }
}
