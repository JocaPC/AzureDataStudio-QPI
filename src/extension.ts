'use strict';
import * as vscode from 'vscode';
import * as request from 'request-promise-native';
import * as sqlops from 'azdata';
import {placeScript} from './placescript';

export function activate(context: vscode.ExtensionContext) {
    const baseUrl = "https://raw.githubusercontent.com/jocapc/QPI/master/src/";

    
    // Importing QPI scripts
    var installQPI = async () => {
        let fileName = "qpi.sql";
        var options = {
            uri: baseUrl + fileName,
        };
        const scriptText = await request.get(options);
        new placeScript().placescript(fileName,scriptText);
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
        new placeScript().placescript(fileName,scriptText);
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
        new placeScript().placescript(fileName,scriptText);
    };
    var installQpiAgentCmd = vscode.commands.registerCommand('qpi.schedule', installQPIAgent);
    context.subscriptions.push(installQpiAgentCmd);

}

export function deactivate() {
}

