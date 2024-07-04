package org.choongang.board.entities;

import lombok.Data;
import org.choongang.file.entities.FileInfo;

import java.util.List;
@Data
public abstract class AbstractBoard {
    private List<FileInfo> editorFiles;
    private List<FileInfo> attachFiles;
}
