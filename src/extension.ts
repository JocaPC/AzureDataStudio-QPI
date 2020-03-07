'use strict';
import * as vscode from 'vscode';
import * as request from 'request-promise-native';

async function showScript(fileName, scriptText) {
    var setting: vscode.Uri = vscode.Uri.parse("untitled:" + fileName);
    try {
        let doc = await vscode.workspace.openTextDocument(setting);
        let editor = await vscode.window.showTextDocument(doc, 1, false);
        editor.edit(edit => {
            edit.insert(new vscode.Position(0, 0), scriptText);
        });
        vscode.window.showInformationMessage("Execute the script on the target database.");
    } catch (err) {
        vscode.window.showErrorMessage(err);
    }
}

export function activate(context: vscode.ExtensionContext) {
    const baseUrl = "https://raw.githubusercontent.com/jocapc/QPI/master/src/";

    // Importing QPI scripts
    var installQPI = async () => {
        let fileName = "qpi.sql";
        var options = {
            uri: baseUrl + fileName,
        };
        const scriptText = await request.get(options);
        await showScript(fileName, scriptText);
    };
    var installQpiCmd = vscode.commands.registerCommand('qpi.install', installQPI);
    context.subscriptions.push(installQpiCmd);

    // Remove QPI scripts
    var removeQPI = async () => {
        let fileName = "qpi.clean.sql";
        var options = {
            uri: baseUrl + fileName,
        };
        const scriptText = await request.get(options);
        await showScript(fileName,scriptText);
    };
    var removeQpiCmd = vscode.commands.registerCommand('qpi.remove', removeQPI);
    context.subscriptions.push(removeQpiCmd);

    // Add QPI Job Agent
    var installQPIAgent = async () => {
        let fileName = "qpi.collection.agent.sql";
        var options = {
            uri: baseUrl + fileName,
        };
        const scriptText = await request.get(options);
        await showScript(fileName,scriptText);
    };
    var installQpiAgentCmd = vscode.commands.registerCommand('qpi.schedule', installQPIAgent);
    context.subscriptions.push(installQpiAgentCmd);
}

export function deactivate() {
}

